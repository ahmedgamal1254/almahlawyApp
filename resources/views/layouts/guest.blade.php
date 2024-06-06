<!DOCTYPE html>
<html lang="ar">
<head>
    <!-- Main Meta Tags -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Important Meta Tags -->
    <meta name="author" content="enote" />
    <meta name="description" content="">
    <meta name="keywords" content="" />
    <!-- Library Styles -->
    <link rel="stylesheet" href="{{ asset("assets/student_assets/scss/libs/bootstrap.min.css") }}">
    <link rel="stylesheet" href="https://cdn.plyr.io/3.6.2/plyr.css" />

    <!-- Main Style -->
    <link rel="stylesheet" href="{{ asset("assets/student_assets/main.css")}}" />

    <!-- Page Title & Icon -->
    <title>@yield("title")</title>
    <link rel="shortcut icon" href="{{ asset("assets/student_assets/images/m icon.png") }}" />
    <style>
    </style>
</head>
<body>
<!-- Start Content -->
@yield("content")

<!-- Main Scripts -->
<script src="{{ asset("assets/student_assets/js/libs/jquery-3.6.3.min.js") }}"></script>
<script src="{{ asset("assets/student_assets/js/libs/bootstrap.min.js") }}"></script>
<script src="{{ asset("assets/student_assets/js/libs/popper.js") }}"></script>
<script src="https://cdn.plyr.io/3.6.2/plyr.polyfilled.js"></script>
<script src="{{ asset("assets/student_assets/main.js") }}"></script>
@yield("script")
</body>
</html>
