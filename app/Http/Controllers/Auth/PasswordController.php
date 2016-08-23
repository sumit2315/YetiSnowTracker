<?php

/**
 * Password Controller : Define's all User forgot password and reset password functionalities.
 * Author : Seasia Infotech
 * Version : 1.0
 * */

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ResetsPasswords;
use Illuminate\Contracts\Auth\PasswordBroker;
use Illuminate\Http\Request;
use App\User;
use Mail;
use Session;
use Hash;
use Validator;
use Illuminate\Support\Facades\Input;

class PasswordController extends Controller {

    use ResetsPasswords;

    /**
     * Create a new password controller instance.
     * @return void
     */
    public function __construct(PasswordBroker $passwords) {
        $this->passwords = $passwords;
        $this->middleware('guest');
    }

    /**
     * Display the form to request a password reset link.
     * @return Response
     */
    public function getForgotPassword() {
        return view('admin.forgotpassword');
    }

    /**
     * Send a reset link to the given user.
     * @param  Request  $request
     * @return Response
     */
    public function postForgotPassword(Request $request) {

        $rules = User::forgotPasswordValidationRule();
        $input = Input::all();
        /**
         * Validate the user 
         * Also the messages are by default 
         * You can customize by passing the third parameter $messages
         **/
        $validation = Validator::make($input, $rules);

        if ($validation->fails()) {
            $validationMessageParams = $validation->errors()->all();
            $errorMessages = User::loadErrors($validationMessageParams);
            Session::flash('failure', $errorMessages);
            return redirect('forgotpassword');
        } else {

            $email = $request->email;
            $getUserExistance = User::where('email', '=', $email)->get()->toArray();
            if (!empty($getUserExistance)) {
                $token = uniqid();
                $reset_password = array('reset_password' => $token);
                $user = User::where('email', '=', $email)->update($reset_password);
                $Mail = Mail::send('emails.password', ['email' => $email, 'token' => $token], function($message) use ($email) {
                            $message->from('support@yeti', 'Yeti Snow Tracker');
                            $message->to($email);
                            $message->subject('Welcome to Yeti Snow Tracker – Password Recovery Link!');
                        });
                if ($Mail) {
                    Session::flash('success', 'Email sent successfully.');
                    return redirect('login');
                } else {
                    Session::flash('failure', 'Email not sent.');
                    return redirect('forgotpassword');
                }
            } else {
                Session::flash('failure', 'Email does not exist.');
                return redirect('forgotpassword');
            }
        }
    }

    /**
     * Display the form to reset password.
     * @param  Request  $request
     * @return Response
     */
    public function getResetpassword(Request $request) {
        if (isset($request->token) && !empty($request->token)) {
            $token = $request->token;
            $getemail = User::where('reset_password', '=', $token)->get()->toArray();
            if (empty($getemail)) {
                Session::flash('failure', 'Access token expired, please use forgot your password link.');
                return redirect('login');
            } else {
                $email = $getemail[0]['email'];
            }
        } else {
            Session::flash('failure', 'Access Token can not be empty.');
            return redirect('login');
        }
        return view('admin.reset', compact('email'));
    }

    /**
     * function to get the post values and reset a new password.
     * @param  Request  $request
     * @return Response
     */
    public function postResetpassword(Request $request) {

        $rules = User::resetPasswordValidationRule();
        $input = Input::all();
        /**
         * Validate the user 
         * Also the messages are by default 
         * You can customize by passing the third parameter $messages
         **/
        $validation = Validator::make($input, $rules);

        if ($validation->fails()) {
            $validationMessageParams = $validation->errors()->all();
            $errorMessages = User::loadErrors($validationMessageParams);
            Session::flash('failure', $errorMessages);
            return redirect('reset');
        } else {
            $password = Hash::make($request->password);
            $email = $request->email;
            $array = array('reset_password' => '', 'password' => $password);
            $getUpdatedData = User::where('email', '=', $email)->update($array);
            if ($getUpdatedData) {
                Session::flash('success', 'Password reset successfully.');
                return redirect('login');
            } else {
                Session::flash('failure', 'Password not changed.');
                return redirect('login');
            }
        }
    }

}
