@include('admin.header')
<section>
    <div class="signinpanel"> 
        <div class="row">
            <div class="col-md-7"> 
                <div class="signin-info">
                    <div class="logopanel">
                        <h1><span>Yeti </span>Snow Tracker </h1>
                    </div><!-- logopanel -->
                    <div class="mb20"></div>
                    <h5><strong>Welcome to Yeti Snow Tracker</strong></h5>                 
                </div><!-- signin0-info -->
            </div><!-- col-sm-7 -->
            <div class="col-md-5">
                <form id="loginForm" action="{{ url('post-login') }}" id="adminLoginForm" method="post">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}"/>
                    <h4 class="nomargin">Sign In</h4>
                    <p class="mt5 mb20">Login to access your account.</p>
                    <input type="text" name="email" value="{{ old('email') }}" class="form-control uname pd30" placeholder="Email" />
                    <input type="password" value="{{ old('password') }}" name="password" class="form-control pword pd30" placeholder="Password" />
                    <br>
                    <a href="{{ url('forgotpassword') }}">Forgot your password?</a>
                    <button class="btn btn-success btn-block">Sign In</button>
                    <?php
                    $url_array = explode('.', parse_url(Request::url(), PHP_URL_HOST));
                     $subdomain = $url_array[0];
                     if($subdomain == 'appsndevs'){
                     ?>
							<a href="{{ url('registeration') }}">Don't have login, Please sign up.</a>
                    <?php } ?>
                </form>  
            </div><!-- col-sm-5 -->
        </div><!-- row -->
        <div class="signup-footer">
            <div class="pull-left">
                &copy; Yeti Snow Tracker
            </div>
        </div>
    </div><!-- signin -->
</section>
@include('admin.footer')
