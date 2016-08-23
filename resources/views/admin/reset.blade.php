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
                <form id="resetForm" action="{{ url('post-reset') }}" id="adminLoginForm" method="post">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                    <h4 class="nomargin">Please reset your password</h4>
                    <input type="email" readonly="readonly" placeholder="Please enter email" class="form-control" name="email" value="<?php echo $email; ?>">
                    <input type="password" placeholder="Please enter password"  class="form-control pword pd30" name="password" id="password">
                    <input type="password" placeholder="Please enter confirm password" class="form-control pword pd30" name="confirm_password">
                    <button type="submit" class="btn btn-success btn-block">
                        Reset Password
                    </button>
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
