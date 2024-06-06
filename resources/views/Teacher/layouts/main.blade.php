<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="rtl">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="enote">
    <title>Home | Maren</title>
    @include("Teacher.layouts.css")
    @yield("css")
    <style>
        .loader {
            margin: auto;
            border: 1px solid #EAF0F6;
            border-radius: 50%;
            border-top: 2px solid #FF7A59;
            width: 25px;
            height: 25px;
            animation: spinner 1s linear infinite;
            /* display: none; */
        }

        @keyframes spinner {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<!-- END: Head-->

<!-- BEGIN: Body-->
<body class="vertical-layout vertical-menu-modern  navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="">
    <!-- BEGIN: Header-->
    @include("Teacher.layouts.header")
    <!-- END: Header-->

    <!-- BEGIN: Main Menu-->
    @include("Teacher.layouts.sidebar")
    <!-- END: Main Menu-->

    <!-- BEGIN: Content-->
    @yield("content")
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <!-- BEGIN: Footer-->
    <button class="btn btn-primary btn-icon scroll-top" type="button"><i data-feather="arrow-up"></i></button>
    <!-- END: Footer-->

    @include("Teacher.layouts.script")
    @yield("script")
</body>
<!-- END: Body-->
</html>
