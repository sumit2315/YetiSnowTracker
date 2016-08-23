<!--Scripts to be loaded at runtime for various functionalities-->        
<script src="{{ asset('assets/js/jquery-1.10.2.min.js') }}"></script>
<script src="{{ asset('assets/js/custom.js') }}"></script>
<script src="{{ asset('assets/js/jquery.datatables.min.js') }}"></script>
<script src="{{ asset('assets/js/bootstrap-wizard.min.js') }}"></script>
<script src="{{ asset('assets/js/jquery.validate.min.js') }}"></script>
<link href="{{ asset('assets/css/jquery.gritter.css') }}" rel="stylesheet">
<script src="{{ asset('assets/js/jquery.gritter.min.js') }}" type="text/javascript"></script>
<script src="{{ asset('assets/js/bootbox.min.js') }}"></script>
<link rel="stylesheet" href="{{ asset('assets/css/bootstrap-datepicker.min.css') }}">
<script src="{{ asset('assets/js/bootstrap-datepicker.min.js') }}"></script>
 
<!--Flash message to load the session response-->
<?php if(Session::has('success')) { ?>
        <script type="text/javascript">
            $.gritter.add({
            title: 'Success',
            text: "<?php echo Session::get('success');  ?>",
            image: '{{ asset("assets/images/screen.png") }}',
            time: 5000,
            position: 'center',
            class_name: 'growl-success'
            });
        </script>  
 <?php } elseif(Session::has('failure')) { ?>
        <script type="text/javascript">
            $.gritter.add({
            title: 'Failure',
            text: "<?php echo Session::get('failure');  ?>",
            image: '{{ asset("assets/images/screen.png") }}',
            time: 5000,
            position: 'center',
            class_name: 'growl-danger'
            });
        </script> 
<?php } ?>
</body>
</html>
