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

    <!-- Page Title & Icon -->
    <title>@yield("title")</title>
    <link rel="shortcut icon" href="{{ asset("assets/student_assets/images/m icon.png") }}" />
    <style>
        .fa-unlock{
            text-decoration: none;
            background: linear-gradient(-118deg, #0046ed, #00c5da) !important;
            width: 100%;
            margin: auto;
            color: #FFF;
            display: inline-block;
            height: 40px;
            border-radius: 8px;
            font-size: 0.7rem;
            font-weight: 700;
            text-align: center;
            line-height: 40px;
            cursor: pointer;
            margin-top: 15px;
            transition: background-color .2s ease-in-out,color .2s ease-in-out,border-color .2s ease-in-out,box-shadow
            .2s ease-in-out,-webkit-box-shadow .2s ease-in-out;
        }

        .card{
            box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
            padding: 14px 25px;
        }

    </style>
</head>
<body>

<!-- *** Start Layout *** -->
<div class="layout">

<!-- ---- Start Header ---- -->
@include("layouts_teacher_view.header")
<!-- ---- End Header ---- -->

<!-- ---- Start PopUps ---- -->
<div class="notification-container">

    <div class="dropdown-box-header-title">
        <span>الإشعارات</span>
        <span class="close-notification">
            <svg viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"/><path d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm0-2a8 8 0 1 0 0-16 8 8 0 0 0 0 16zm0-9.414l2.828-2.829 1.415 1.415L13.414 12l2.829 2.828-1.415 1.415L12 13.414l-2.828 2.829-1.415-1.415L10.586 12 7.757 9.172l1.415-1.415L12 10.586z"/></svg>
        </span>
    </div>

    <div class="notification-content">

        @foreach (Auth::user()->unreadNotifications as $item)
        <a href="{{ route("show_notification",["id"=>$item->id]) }}" class="noti-read">
            <div class="user-status">
                <div class="avatar-small">
                    <span class="person-img">
                        <svg viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"/><path d="M2 8.994A5.99 5.99 0 0 1 8 3h8c3.313 0 6 2.695 6 5.994V21H8c-3.313 0-6-2.695-6-5.994V8.994zM20 19V8.994A4.004 4.004 0 0 0 16 5H8a3.99 3.99 0 0 0-4 3.994v6.012A4.004 4.004 0 0 0 8 19h12zm-6-8h2v2h-2v-2zm-6 0h2v2H8v-2z"/>
                        </svg>
                    </span>
                </div>
                @if ($item->type == 'App\Notifications\UpdatePoints')
                    <div class="user-status-title">
                        <span>اضافة رصيد</span>
                    </div>
                @endif

                <p class="user-status-text">{{ $item->data["msg"] }} {{ $item->data["points"] }} جنيه</p>
                <p class="user-status-timestamp">
                    {{ $diff = Carbon\Carbon::parse($item->created_at)->diffForHumans(Carbon\Carbon::now()) }}
                </p>
            </div>
        </a>
        @endforeach
        {{-- <div class="load-more-line">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                <path d="M14.5 20.7259C14.6 21.2259 14.2 21.826 13.7 21.926C13.2 22.026 12.6 22.0259 12.1 22.0259C9.5 22.0259 6.9 21.0259 5 19.1259C1.4 15.5259 1.09998 9.72592 4.29998 5.82592L5.70001 7.22595C3.30001 10.3259 3.59999 14.8259 6.39999 17.7259C8.19999 19.5259 10.8 20.426 13.4 19.926C13.9 19.826 14.4 20.2259 14.5 20.7259ZM18.4 16.8259L19.8 18.2259C22.9 14.3259 22.7 8.52593 19 4.92593C16.7 2.62593 13.5 1.62594 10.3 2.12594C9.79998 2.22594 9.4 2.72595 9.5 3.22595C9.6 3.72595 10.1 4.12594 10.6 4.02594C13.1 3.62594 15.7 4.42595 17.6 6.22595C20.5 9.22595 20.7 13.7259 18.4 16.8259Z" fill="black"/>
                <path opacity="0.3" d="M2 3.62592H7C7.6 3.62592 8 4.02592 8 4.62592V9.62589L2 3.62592ZM16 14.4259V19.4259C16 20.0259 16.4 20.4259 17 20.4259H22L16 14.4259Z" fill="black"/>
            </svg>
            <span>تحميل المزيد من الرسائل</span>
        </div> --}}

    </div>

    <div class="all-notification">
        <a href="{{ route("notifcations") }}">عرض كل الإشعارات</a>
    </div>

</div>

<div class="user-container">

    <div class="dropdown-box-header-title">
        <span class="close-user">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M5.82843 6.99955L8.36396 9.53509L6.94975 10.9493L2 5.99955L6.94975 1.0498L8.36396 2.46402L5.82843 4.99955H13C17.4183 4.99955 21 8.58127 21 12.9996C21 17.4178 17.4183 20.9996 13 20.9996H4V18.9996H13C16.3137 18.9996 19 16.3133 19 12.9996C19 9.68584 16.3137 6.99955 13 6.99955H5.82843Z"></path></svg>
        </span>
        <span>العودة</span>
    </div>

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
                                    <span>{{ $teacher->subject }}</span>
                                </div>
                            </a>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>

    </div>

</div>
<!-- ---- End PopUps ---- -->

<!-- ---- Start Big NavBar ---- -->
@include("layouts_teacher_view.sidebar")
<!-- ---- End Big NavBar ---- -->

<!-- ---- Start Shadow Overlay ---- -->
<div class="close-overlay"></div>
<!-- ---- End Shadow Overlay ---- -->

</div>
<!-- *** End Layout *** -->

<!-- Start Content -->
<div class="content">
    @yield("content")
</div>
<!-- End Content -->

<!-- Main Scripts -->
@include("layouts_teacher_view.script")

</body>
</html>
