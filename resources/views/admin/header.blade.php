<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="csrf-token" content="{!! csrf_token() !!}" />
        <link rel="shortcut icon" href="{{ asset('assets/front-end/images/logo.png') }}" type="image/png">
        <title><?php echo 'Yeti: Snow Tracker'; ?></title>
        <link href="{{ asset('assets/css/style.default.css') }}" rel="stylesheet">
        <link href="{{ asset('assets/css/jquery.datatables.css') }}" rel="stylesheet">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>
    <body style="background: #cecece none repeat scroll 0 0;">
        <!-- Preloader -->
        <div id="preloader">
            <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
        </div>