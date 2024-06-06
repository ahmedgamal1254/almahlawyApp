<!-- BEGIN: Main Menu-->
<div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true">
    <div class="navbar-header">
        <ul class="nav navbar-nav flex-row">
            <li class="nav-item mr-auto"><a class="navbar-brand" href="{{ route("student_dashboard") }}">
                <span class="brand-logo">
                        <img src="{{ asset("theme/app-assets/images/logo/m icon.png")}}" alt="">
                    </span>
                    <h2 class="brand-text">
                        {{-- <img src="{{ asset("theme/app-assets/images/logo/logon.png")}}" alt=""> --}}
                        منصة مَرِن
                    </h2>
                </a></li>
            <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="d-block d-xl-none text-primary toggle-icon font-medium-4" data-feather="x"></i><i class="d-none d-xl-block collapse-toggle-icon font-medium-4  text-primary" data-feather="disc" data-ticon="disc"></i></a></li>
        </ul>
    </div>
    <div class="shadow-bottom"></div>
    <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
            @foreach ($teachers as $teacher)
                <li class="nav-item"><a href="{{ route("student_teacher",[$teacher->id]) }}"><i class="la la-mouse-pointer"></i><span
                    class="menu-title" data-i18n="nav.add_on_drag_drop.main">{{ $teacher->name }}</span></a>
                </li>
            @endforeach
        </ul>
    </div>
</div>
<!-- END: Main Menu-->
