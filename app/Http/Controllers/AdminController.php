<?php
/**
 * Admin Controller : Defines and performs all the Admin related functional tasks.
 * Author : Seasia Infotech
 * Version : 1.0
**/
namespace App\Http\Controllers;

use Hash;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\User;
use Session;
use Validator;
use Auth;
use URL;
use Mail;
use Redirect;


class AdminController extends Controller{
    
    /**
     * function getRegister : loads the registration page
     * Author : Seasia Infoteh
     * return void
    **/
    function getRegister(Request $request){  
		$url_array = explode('.', parse_url($request->url(), PHP_URL_HOST));
		$subdomain = $url_array[0];
		if($subdomain == 'appsndevs'){
			if(Auth::User()){
				return redirect('dashboard');
			}else{
				return view('admin.register'); 
			}  
		}else{
			Session::flash('failure', 'Sub-Domains are not authorised for registration.');
			return redirect('login');
		} 
    }


    /**
     * function postRegister : post the input values from user for the registration process
     * @parameters $request
     * return to appropriate route
     */ 
    function postRegister(Request $request){
   
        $rules = User::registerValidationRule();
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
            return Redirect::to('registeration')->withInput();
        } else {

            $email = User::where('email', '=', $request->email)->get()->count();
            $username = User::where('username', '=', $request->username)->get()->count();
            if (empty($username)) {
                if (empty($email)) {

                    $user = User::registerUser($request);
                    $userId = $user->id;
                    if(!empty($userId)){
                        $name = $request->firstname." ".$request->lastname;
                        $encEmail = base64_encode($request->email);
                        $baseUrl = explode('//', URL::route('login'));
                        $url = $request->username.".".$baseUrl[1].'?email='.$encEmail;
                        $subdomain = $request->username.".".$baseUrl[1];
                        $Mail = Mail::send('emails.verifyUser', ['name' => $name,'password' => $request->password,'subdomain'=>$subdomain,'url' => $url,'email' => $request->email], function($message) use ($email,$request) {
                                $message->from('support@yeti', 'Yeti Snow Tracker');
                                $message->to($request->email);
                                $message->subject('Welcome to Yeti Snow Tracker – Account Activation Link!');
                            });
                        Session::flash('success', 'Registered successfully, Please check your email to activate your account.');
                        return redirect('login');
                    } else {
                        Session::flash('failure', 'Registration Failed.');
                        return Redirect::to('registeration')->withInput();
                    }
                    
                } else {
                    Session::flash('failure', 'Email already exist.');
                    return Redirect::to('registeration')->withInput();
                }
            } else {
                Session::flash('failure', 'Username already exist.');
                return Redirect::to('registeration')->withInput();
            }
        }
    }

    /**
     * function dashboard : redirect user to dashboard if logged in else redirect to login page
     * return void
     */ 
    function dashboard(){
        if (Auth::Check()) {
            return view('admin.dashboard');  
        } else {
            return redirect('login');
        }     
    }   
}



