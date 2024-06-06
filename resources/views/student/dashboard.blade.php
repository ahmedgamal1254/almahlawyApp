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
    <link href="https://fonts.googleapis.com/css?family=Cairo&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-rtl/3.4.0/css/bootstrap-rtl.min.css">
    <link rel="stylesheet" href="{{ asset("assets/teacher_assets/assets/css/toastr.css") }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.9/sweetalert2.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.9/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <script src="{{ asset("assets/teacher_assets/assets/js/bootstrap.bundle.min.js") }}"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <script src="{{ asset("assets/teacher_assets/assets/js/plupload.full.min.js") }}"></script>
    <link href="https://unpkg.com/filepond/dist/filepond.css" rel="stylesheet">
    @yield("title_script")
    <!-- Page Title & Icon -->
    <title>التبديل بين المدرسين</title>
    <link rel="shortcut icon" href="{{ asset("assets/student_assets/images/m icon.png") }}" />
</head>
<body>
<!-- Start Content -->
<div class="user-container open-user-container">
    <div class="user-container-content">

        <div class="user-container-content-header">
            <h3>تبديل الحساب</h3>
            <span>قم بإختيار المدرس الذى تريد عرض المحتوى الخاص بة</span>
        </div>

        <div class="user-container-content-toggle">
            <div class="row justify-content-center">
                @foreach ($teachers as $teacher)
                    <div class="col-sm-6 justify-content-center">
                        <div class="user-container-content-toggle-card">
                            <a href="{{ route("student_teacher",["id"=>$teacher->id]) }}">
                                <div class="user-image-parent">
                                    <figure style="background-image: url({{ asset("public/app/".$teacher->img_url) }}")></figure>
                                </div>
                                <div class="user-info-parent">
                                    <h3>{{ $teacher->name }}</h3>
                                    <span>{{ $teacher->subject_name }}</span>
                                </div>
                            </a>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
</div>
<!-- End Content -->

<!-- Main Scripts -->
@include("layouts_teacher_view.script")
</body>
</html>
