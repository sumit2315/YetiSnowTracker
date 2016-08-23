<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

/*
 * Admin Controller Routes
 */
Route::get('registeration', ['as' => 'registeration', 'uses' => 'AdminController@getRegister']);
Route::post('register', ['as' => 'register', 'uses' => 'AdminController@postRegister']);
Route::get('dashboard', ['as' => 'dashboard', 'uses' => 'AdminController@dashboard']);
/*
 * Auth Controller Routes
 */
Route::get('/', ['as' => '/', 'uses' => 'Auth\AuthController@getLogin']);
Route::get('login', ['as' => 'login', 'uses' => 'Auth\AuthController@getLogin']);
Route::post('post-login', ['as' => 'post-login', 'uses' => 'Auth\AuthController@postLogin']);
Route::get('logout', ['as' => 'logout', 'uses' => 'Auth\AuthController@getLogout']);
/*
 * Password Controller Routes
 */
Route::get('forgotpassword', ['as' => 'forgotpassword', 'uses' => 'Auth\PasswordController@getForgotPassword']);
Route::post('post-forgotpassword', ['as' => 'post-forgotpassword', 'uses' => 'Auth\PasswordController@postForgotPassword']);
Route::get('reset', ['as' => 'reset', 'uses' => 'Auth\PasswordController@getResetpassword']);
Route::post('post-reset', ['as' => 'post-reset', 'uses' => 'Auth\PasswordController@postResetpassword']);


