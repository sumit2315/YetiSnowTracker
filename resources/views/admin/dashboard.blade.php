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
                    <h5><strong>Welcome, {{ @Auth::user()->firstname }} {{ @Auth::user()->lastname }}</strong></h5>
                    <h5><a href="{{ url('logout') }}"><strong>Logout</strong></a></h5>
                </div><!-- signin-info -->
            </div><!-- col-md-7 -->
        </div><!-- row -->
        <div class="signup-footer">
            <div class="pull-left">
                &copy; Yeti Snow Tracker
            </div>
        </div>
    </div><!-- signin -->

</section>
<script type="text/javascript">
   history.pushState(null, null, document.title);
window.addEventListener('popstate', function () {
    history.pushState(null, null, document.title);
});    
</script>
@include('admin.footer')
