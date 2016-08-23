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
                </div><!-- signin-info -->
            </div><!-- col-md-7 -->
            <div class="col-md-5">  
                <form id="forgotpasswordForm" action="{{ url('post-forgotpassword') }}" id="adminLoginForm" method="post">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}"/>
                    <h4 class="nomargin">Forgot Password?</h4>
                    <p>We will send a link on your email to reset your password.</p>
                    <input type="text" name="email" value="{{ old('email') }}" class="form-control uname pd30" placeholder="Email" />                    
                    <input type="submit" value="Submit" class="btn btn-success btn-block">
                    <a href="{{ url('login') }}" class="btn btn-danger btn-block" style="color: #FFFFFF !important;"> Cancel </a>
                </form>
            </div><!-- col-md-5 --> 
        </div><!-- row -->
        <div class="signup-footer">
            <div class="pull-left">
                &copy; Yeti Snow Tracker
            </div>
        </div>
    </div><!-- signin -->
</section>
@include('admin.footer')
