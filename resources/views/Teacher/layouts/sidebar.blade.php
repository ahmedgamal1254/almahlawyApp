<!-- BEGIN: Main Menu-->
<div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true">
    <div class="navbar-header">
        <ul class="nav navbar-nav flex-row">
            <li class="nav-item mr-auto"><a class="navbar-brand" href="{{ route("teacher") }}">
                <span class="brand-logo">
                        <img src="{{ asset("assets/landing_assets/img/logo-al.png")}}" alt="">
                    </span>
                    <h2 class="brand-text">
                        {{-- <img src="{{ asset("assets/landing_assets/img/logo-al.png")}}" alt=""> --}}
                        أكاديمية المحلاوى
                    </h2>
                </a></li>
            <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="d-block d-xl-none text-primary toggle-icon font-medium-4" data-feather="x"></i><i class="d-none d-xl-block collapse-toggle-icon font-medium-4  text-primary" data-feather="disc" data-ticon="disc"></i></a></li>
        </ul>
    </div>
    <div class="shadow-bottom"></div>
    <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">

            <li class=" navigation-header"><span data-i18n="Apps &amp; Pages">لوحة التحكم</span><i data-feather="more-horizontal"></i></li>

            <li class="nav-item active"><a class="d-flex align-items-center" href="{{ route("teacher") }}"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">الرئيسية</span></a>
            </li>

            {{-- <li class="nav-item"><a class="d-flex align-items-center" href="index.html">
                <i data-feather="bar-chart"></i><span class="menu-title text-truncate" data-i18n="Dashboards">الإحصائيات</span></a>
            </li> --}}

            <li class=" navigation-header"><span data-i18n="Apps &amp; Pages">منطقة الطلاب</span><i data-feather="more-horizontal"></i>
            </li>

            <li class=" nav-item"><a class="d-flex align-items-center" href="#"><i data-feather="layout"></i><span class="menu-title text-truncate" data-i18n="Invoice">الصفوف الدراسية</span></a>
                <ul class="menu-content">
                    <li><a class="d-flex align-items-center" href="{{ route("school_grade") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">جميع الصفوف</span></a>
                    </li>
                    <li><a class="d-flex align-items-center" href="{{ route("school_grade.add") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="Preview">إضافة صف</span></a>
                    </li>
                </ul>
            </li>

            <li class=" nav-item"><a class="d-flex align-items-center" href="#"><i data-feather="users"></i><span class="menu-title text-truncate" data-i18n="Invoice">المجموعات</span></a>
                <ul class="menu-content">
                    <li><a class="d-flex align-items-center" href="{{ route("class") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">جميع المجموعات</span></a>
                    </li>
                    <li><a class="d-flex align-items-center" href="{{ route("class.add") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="Preview">إضافة مجموعة</span></a>
                    </li>
                </ul>
            </li>

            <li class=" nav-item"><a class="d-flex align-items-center" href="#"><i data-feather="user"></i><span class="menu-title text-truncate" data-i18n="Invoice">الطلاب</span></a>
                <ul class="menu-content">
                    <li><a class="d-flex align-items-center" href="{{ route("students") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">جميع الطلاب</span></a>
                    </li>
                    <li><a class="d-flex align-items-center" href="{{ route("students.points") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">الطلاب الاعلى نقاطا</span></a>
                    </li>
                    <li><a class="d-flex align-items-center" href="{{ route("students.add") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="Preview">إضافة طالب</span></a>
                    </li>
                </ul>
            </li>

            <li class=" navigation-header"><span data-i18n="Apps &amp; Pages">المحتوى التعليمي</span><i data-feather="more-horizontal"></i>
            </li>

            <li class=" nav-item"><a class="d-flex align-items-center" href="#"><i data-feather="layout"></i><span class="menu-title text-truncate" data-i18n="Invoice">الابواب(الفصول)</span></a>
                <ul class="menu-content">
                    <li>
                        <a class="d-flex align-items-center" href="{{ route("units") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">جميع الابواب(الفصول)</span></a>
                    </li>
                    <li>
                        <a class="d-flex align-items-center" href="{{ route("unit.add") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="Preview">إضافة فصل جديد</span></a>
                    </li>
                </ul>
            </li>

            <li class=" nav-item"><a class="d-flex align-items-center" href="#"><i data-feather="box"></i><span class="menu-title text-truncate" data-i18n="Invoice">بنك الأسئلة</span></a>
                <ul class="menu-content">
                    <li><a class="d-flex align-items-center" href="{{ route("questions") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">جميع الأسئلة</span></a>
                    </li>
                    <li><a class="d-flex align-items-center" href="{{ route("question.add") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="Preview">إضافة سؤال</span></a>
                    </li>
                </ul>
            </li>

            <li class=" nav-item"><a class="d-flex align-items-center" href="#"><i data-feather="file-text"></i><span class="menu-title text-truncate" data-i18n="Invoice">الإختبارات الإلكترنية</span></a>
                <ul class="menu-content">
                    <li><a class="d-flex align-items-center" href="{{ route("exams") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">جميع الإختبارات</span></a>
                    </li>
                    <li><a class="d-flex align-items-center" href="{{ route("exam.add") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="Preview">إضافة إختبار</span></a>
                    </li>
                </ul>
            </li>

            <li class=" nav-item"><a class="d-flex align-items-center"
                href="#"><i data-feather="file-text"></i><span class="menu-title text-truncate" data-i18n="Invoice">الإختبارات الورقية</span></a>
                <ul class="menu-content">
                    <li><a class="d-flex align-items-center" href="{{ route("teacher.paper-exams") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">جميع الإختبارات</span></a>
                    </li>
                    <li><a class="d-flex align-items-center" href="{{ route("teacher.paper-exams.create") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="Preview">إضافة إختبار</span></a>
                    </li>
                </ul>
            </li>

            <li class=" nav-item"><a class="d-flex align-items-center" href="#"><i data-feather="video"></i><span class="menu-title text-truncate" data-i18n="Invoice">الفيديوهات</span></a>
                <ul class="menu-content">
                    <li><a class="d-flex align-items-center" href="{{ route("lessons") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">جميع الفيديوهات</span></a>
                    </li>
                    <li><a class="d-flex align-items-center" href="{{ route("lesson.add") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="Preview">إضافة فيديو</span></a>
                    </li>
                </ul>
            </li>

            <li class=" nav-item"><a class="d-flex align-items-center" href="#"><i data-feather="book"></i><span class="menu-title text-truncate" data-i18n="Invoice">الكتب الإلكترونية</span></a>
                <ul class="menu-content">
                    <li><a class="d-flex align-items-center" href="{{ route("books") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">جميع الكتب</span></a>
                    </li>
                    <li><a class="d-flex align-items-center" href="{{ route("book.add") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="Preview">إضافة كتاب</span></a>
                    </li>
                </ul>
            </li>

            <li class=" nav-item"><a class="d-flex align-items-center" href="#"><i data-feather="tv"></i><span class="menu-title text-truncate" data-i18n="Invoice">الفصول الإفتراضية</span></a>
                <ul class="menu-content">
                    <li><a class="d-flex align-items-center" href="{{ route("teacher.sessions") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">جميع الفصول</span></a>
                    </li>
                    <li><a class="d-flex align-items-center" href="{{ route("teacher.sessions.create") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="Preview">إضافة فصل</span></a>
                    </li>
                </ul>
            </li>

            <li class=" navigation-header"><span data-i18n="Apps &amp; Pages">المحتوى المجانى</span><i data-feather="more-horizontal"></i>
            </li>

            <li class=" nav-item"><a class="d-flex align-items-center" href="#"><i data-feather="video"></i><span class="menu-title text-truncate" data-i18n="Invoice">الفيديوهات</span></a>
                <ul class="menu-content">
                    <li><a class="d-flex align-items-center" href="{{ route("free-lessons") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">جميع الفيديوهات</span></a>
                    </li>
                    <li><a class="d-flex align-items-center" href="{{ route("free-lesson.add") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="Preview">إضافة فيديو</span></a>
                    </li>
                </ul>
            </li>

            <li class=" nav-item"><a class="d-flex align-items-center" href="#"><i data-feather="book"></i><span class="menu-title text-truncate" data-i18n="Invoice">الكتب الإلكترونية</span></a>
                <ul class="menu-content">
                    <li><a class="d-flex align-items-center" href="{{ route("free-books") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">جميع الكتب</span></a>
                    </li>
                    <li><a class="d-flex align-items-center" href="{{ route("free-book.add") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="Preview">إضافة كتاب</span></a>
                    </li>
                </ul>
            </li>


            <li class=" navigation-header"><span data-i18n="Forms &amp; Tables">الشهور &amp;</span><i data-feather="more-horizontal"></i>
            </li>

            <li class=" nav-item"><a class="d-flex align-items-center" href="#"><i data-feather="calendar"></i><span class="menu-title text-truncate" data-i18n="Invoice">الشهور</span></a>
                <ul class="menu-content">
                    <li><a class="d-flex align-items-center" href="{{ route("show_months") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">جميع الشهور</span></a>
                    </li>
                    <li><a class="d-flex align-items-center" href="{{ route("months.add") }}">
                        <i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">اضافة شهر</span></a>
                    </li>
                    {{-- <li><a class="d-flex align-items-center" href="{{ route("refresh_months") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="Preview">تحديث</span></a>
                    </li> --}}
                </ul>
            </li>


            <li class="nav-item"><a class="d-flex align-items-center" href="{{ route("all_payments") }}"><i data-feather="credit-card"></i><span class="menu-title text-truncate" data-i18n="Dashboards">عمليات إضافة الرصيد</span></a>
            </li>

            <li class=" navigation-header"><span data-i18n="Forms &amp; Tables">التدوينات</span><i data-feather="more-horizontal"></i>
            </li>

            <li class=" nav-item"><a class="d-flex align-items-center" href="#"><i data-feather="calendar"></i><span class="menu-title text-truncate" data-i18n="Invoice">التدوينات</span></a>
                <ul class="menu-content">
                    <li><a class="d-flex align-items-center" href="{{ route("posts") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">جميع المنشورات</span></a>
                    </li>
                    <li><a class="d-flex align-items-center" href="{{ route("post.add") }}"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="Preview">اضافة منشور جديد</span></a>
                    </li>
                </ul>
            </li>

            {{-- <li class=" navigation-header"><span data-i18n="Forms &amp; Tables">الصلاحيات &amp; الأدوار</span><i data-feather="more-horizontal"></i>
            </li>

            <li class=" nav-item"><a class="d-flex align-items-center" href="#"><i data-feather="user-plus"></i><span class="menu-title text-truncate" data-i18n="Invoice">الصلاحيات</span></a>
                <ul class="menu-content">
                    <li><a class="d-flex align-items-center" href="#"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">جميع الدوار</span></a>
                    </li>
                    <li><a class="d-flex align-items-center" href="#"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="Preview">إضافة دور</span></a>
                    </li>
                </ul>
            </li> --}}

            {{-- <li class=" nav-item"><a class="d-flex align-items-center" href="#"><i data-feather="user-check"></i><span class="menu-title text-truncate" data-i18n="Invoice">المشرفين</span></a>
                <ul class="menu-content">
                    <li><a class="d-flex align-items-center" href="#">
                        <i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">جميع المشرفين</span></a>
                    </li>
                    <li><a class="d-flex align-items-center" href="#"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="Preview">إضافة مشرف</span></a>
                    </li>
                </ul>
            </li> --}}

            <li class=" navigation-header"><span data-i18n="Forms &amp; Tables">الإعدادات</span><i data-feather="more-horizontal"></i>
            </li>

            <li class="nav-item"><a class="d-flex align-items-center" href="{{ route("teacher.edit") }}"><i data-feather="settings"></i><span class="menu-title text-truncate" data-i18n="Dashboards">الإعدادات</span></a>
            </li>
        </ul>
    </div>
</div>
<!-- END: Main Menu-->
