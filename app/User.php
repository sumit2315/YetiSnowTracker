<?php

/**
 * User Model : Defines and performs all the User and Admin related functional tasks.
 * Author : Seasia Infotech
 * Version : 1.0
 * */

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Hash;

class User extends Authenticatable {

    /**
     * The database table used by the model.
     * @var string
     */
    protected $table = 'users';

    /**
     * The attributes that are mass assignable.
     * @var array
     */
    protected $fillable = ['firstname', 'lastname', 'username','email', 'address1', 'status', 'password', 'reset_password' , 'city', 'postal_code', 'mobile_carrier', 'notes', 'company_name', 'fax', 'address2'];
    /**
     * The attributes that should be hidden for arrays.
     * @var array
     */
    protected $hidden = ['remember_token'];

    /*
     * Validation Rules for the Contractor registration
     * @return array
     */

    public static function registerValidationRule() {
        return array(
            'firstname' => 'required | Min:2 | Max:32 | Alpha',
            'lastname' => 'required | Min:2 | Max:32 | Alpha',
            'email' => 'required | between:6,150 | email ',
            'address1' => 'required | Max:150',
            'password' => 'required | Min:6',
            'confirm_password' => 'required | same:password',
            'city' => 'required',
            'postal_code' => 'required | AlphaNum',
            'mobile_carrier' => 'required',
            'notes' => 'required | Max:150',
            'company_name' => 'required | Max:50',
            'fax' => 'required',
            'username' => 'required | AlphaNum | Min:2'
        );
    }

    /*
     * Comman Funtion to load Error Messages*
     * @param  $getParams to get return array of errors from validator
     * @return formatted errors 
     */

    public static function loadErrors($getParams) {
        if (count($getParams) > 0) {
            $errorMessages = "<p style='float: left;'>Errors have occurred:</p>";
            $errorMessages .= "<ul>";
            foreach ($getParams as $message) {
                $errorMessages .= "<li style='float: left; text-align: left;'>$message</li>";
            }
            $errorMessages .= "</ul>";
        }
        return $errorMessages;
    }

    /*
     * Validation Rules for the login form
     * @return array
     */

    public static function loginValidationRule() {
        return array( 
            'email' => 'required | between:6,150 | email ', 
            'password' => 'required'
        );
    }

    /*
     * Validation Rules for the forgot password form
     * @return array
     */
    public static function forgotPasswordValidationRule() {
        return array( 
            'email' => 'required | email '
        );
    }

    /*
     * Validation Rules for the reset password form
     * @return array
     */
    public static function resetPasswordValidationRule() {
        return array( 
            'password' => 'required | Min:6',
            'confirm_password' => 'required | same:password'
        );
    }
    public static function registerUser($request){
        $password = Hash::make($request->password);
        $user = User::create(array(
                        "firstname" => $request->firstname,
                        "lastname" => $request->lastname,
                        "email" => $request->email,
                        "address1" => $request->address1,
                        "password" => $password,
                        "city" => $request->city,
                        "postal_code" => $request->postal_code,
                        "mobile_carrier" => $request->mobile_carrier,
                        "notes" => $request->notes,
                        "company_name" => $request->company_name,
                        "address2" => $request->address2,
                        "fax" => $request->fax,
                        "status" => "0",
                        "username" => strtolower($request->username)
                    )
                );
        return $user;
    }   
}
