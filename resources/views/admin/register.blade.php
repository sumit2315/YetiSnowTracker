@include('admin.header')
<section>
    <div class="container-fluid contentTop">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading"><span class="registerFont">Register</span></div>
                    <div class="panel-body">
                        <form id="registerForm" class="form-horizontal" method="POST" action="{{ url('register') }}" enctype="multipart/form-data">
                            <input type="hidden" name="_token" value="{{ csrf_token() }}">

                            <div class="form-group">
                                <label class="col-md-4 control-label">First Name <span class="red">*</span></label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="firstname" value="{{ old('firstname') }}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label">Last Name <span class="red">*</span></label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="lastname" value="{{ old('lastname') }}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label">Username <span class="red">*</span></label>
                                <div class="col-md-6">
                                    <input type="text" id="" class="form-control username" name="username" value="{{ old('username') }}">
                                </div>
                            </div>
                            
                             <div class="form-group">
                                <label class="col-md-4 control-label">Sub-Domain <span class="red">*</span></label>
                                <div class="col-md-4">
                                    <input type="text" class="form-control getSubDomain" name="subdomain" readonly="readonly" value="{{ old('subdomain') }}">
                                </div>
                                <div class="subDomain">
                                    <?php echo ".".Request::server("HTTP_HOST");?>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label">Email <span class="red">*</span></label>
                                <div class="col-md-6">
                                    <input type="email" class="form-control" name="email" value="{{ old('email') }}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label">Password <span class="red">*</span></label>
                                <div class="col-md-6">
                                    <input type="password" class="form-control" name="password" id="password" value="{{ old('password') }}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label">Confirm Password <span class="red">*</span></label>
                                <div class="col-md-6">
                                    <input type="password" class="form-control" name="confirm_password" value="{{ old('confirm_password') }}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label">Address1 <span class="red">*</span></label>
                                <div class="col-md-6">
                                    <input type="text"  class="form-control" name="address1" value="{{ old('address1') }}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label">Address2</label>
                                <div class="col-md-6">
                                    <input type="text"  class="form-control" name="address2" value="{{ old('address2') }}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label">City <span class="red">*</span></label>
                                <div class="col-md-6">
                                    <input type="text"  class="form-control" name="city" value="{{ old('city') }}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label">Postal Code <span class="red">*</span></label>
                                <div class="col-md-6">
                                    <input type="text"  class="form-control" name="postal_code" value="{{ old('postal_code') }}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label">Mobile Carrier <span class="red">*</span></label>
                                <div class="col-md-6">
                                    <input type="text"  class="form-control" name="mobile_carrier" value="{{ old('mobile_carrier') }}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label">Notes <span class="red">*</span></label>
                                <div class="col-md-6">
                                    <textarea class="form-control" rows="4" name="notes">{{ old('notes') }}</textarea>     
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label">Company Name <span class="red">*</span></label>
                                <div class="col-md-6">
                                    <input type="text"  class="form-control" name="company_name" value="{{ old('company_name') }}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label">Fax <span class="red">*</span></label>
                                <div class="col-md-6">
                                    <input type="text"  class="form-control" name="fax" value="{{ old('fax') }}">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-4">
                                    <button type="submit" class="btn btn-primary">Register</button>
                                    <a class="btn btn-primary" href="{{ url('login') }}">Cancel</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@include('admin.footer')

