<?php

/**
 * Auth Controller : Define's all User Authentications and login functionalities.
 * Author : Seasia Infotech
 * Version : 1.0
 * */

namespace App\Http\Controllers\Auth;

use App\User;
use Session;
use Auth;
use Redirect;
use Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Contracts\Auth\Guard;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Foundation\Auth\AuthenticatesAndRegistersUsers;

class AuthController extends Controller {

use AuthenticatesAndRegistersUsers,ThrottlesLogins;

    /**
     * Create a new authentication controller instance.
     * @return void
     */
    public function __construct(Guard $auth) {
        $this->auth = $auth;
    }

    /**
     * Show the application login form.
     * @return view or redirects to the route
     */
    public function getLogin(Request $request) {
        if (Auth::Check()) {
            return redirect('dashboard');
        } else {  
            if(isset($request->email) && !empty($request->email)){
                $email = $request->email;
                $decodedEmail = base64_decode($email);
                User::where('email', '=', $decodedEmail)->update(array('status'=>1));
                Session::flash('success', 'Account has been activated successfully, Please login now.');
                return redirect('login'); 
            } 
        return view('admin.login'); 
        }
    }

    /**
     * Handle a login request to the application.
     * @param  \Illuminate\Http\Request  $request
     * @return redirect to appropriate route
     */
    public function postLogin(Request $request) {

        $rules = User::loginValidationRule();
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
            return redirect('login');
        } else {

            $credentials = $request->only('email', 'password');
            $email = $request->email;
            $getUserExistance = User::where('email', '=', $email)->get()->toArray();
            if (!empty($getUserExistance)) {
                $getUserStatus = User::where('email', '=', $email)->get();
                $status = $getUserStatus[0]->status;
                if (!empty($status)) {
                    $url_array = explode('.', parse_url($request->url(), PHP_URL_HOST));
                    $subdomain = $url_array[0];
                    $username = $getUserStatus[0]->username;
                    if ($subdomain == $username) {
                        if ($this->auth->attempt($credentials, true)) {
                            $user = Auth::user();
                            return redirect('dashboard');
                        } else {
                            Session::flash('failure', 'Invalid email or password.');
                            return Redirect::to('login')->withInput(); 
                        }
                     } else {
                        Session::flash('failure', 'Incorrect sub domain entered, please check your account activation mail.');
                        return Redirect::to('login')->withInput(); 
                    }
                    
                } else {
                    Session::flash('failure', 'Your account is not active, please check your email or if it was working earlier then contact admin.');
                   return Redirect::to('login')->withInput(); 
                }
            } else {
                Session::flash('failure', 'Invalid email or password.');
                return Redirect::to('login')->withInput();   
            }
        }
    }

    /*
     * Function for auth and user logout
     * @param  \Illuminate\Http\Request  $request
     * @return redirect to appropriate route
     */

    public function getLogout(Request $request) {
        $this->auth->logout();
        $request->session()->flush();
        return redirect('login');
    }

}
