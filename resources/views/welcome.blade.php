<!doctype html>
<html lang="ar" dir="rtl">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Eduserve - Educational Landing Page</title>
    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/img/icons/favicon.html" type="image/x-icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Almarai:wght@300;400;700;800&family=IBM+Plex+Sans+Arabic:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset("assets/landing_assets/css/bootstrap.min.css")}}">
    <link rel="stylesheet" href="{{ asset("assets/landing_assets/css/jquery-ui.css")}}">
    <link rel="stylesheet" href="{{ asset("assets/landing_assets/css/icofont.min.css")}}">
    <link rel="stylesheet" href="{{ asset("assets/landing_assets/css/animate.css")}}">
    <link rel="stylesheet" href="{{ asset("assets/landing_assets/css/owl.carousel.css")}}">
    <link rel="stylesheet" href="{{ asset("assets/landing_assets/css/magnific-popup.css")}}">
    <link rel="stylesheet" href="{{ asset("assets/landing_assets/css/owl.theme.default.min.css")}}">
    <link rel="stylesheet" href="{{ asset("assets/landing_assets/css/style.css")}}">
    <link rel="stylesheet" href="{{ asset("assets/landing_assets/css/responsive.css")}}">
    <style>
        .why-choose-us {
            color: #fff;
            padding: 120px 0px 73px;
            background-image: url({{ asset("assets/landing_assets/img/data.webp") }});
            position: relative;
            background-repeat: no-repeat;
            background-size: cover;
        }

        .row-hero{
            justify-content: center;
            align-items: center;
        }

        .lds-dual-ring {
            color: #ffffff
        }
        .lds-dual-ring,
        .lds-dual-ring:after {
            box-sizing: border-box;
        }

        .lds-dual-ring {
            display: inline-block;
            width: 30px;
            height: 30px;
            display: none;
        }

        .lds-dual-ring:after {
            content: " ";
            display: block;
            width: 25px;
            height: 25px;
            margin: 3px;
            border-radius: 50%;
            border: 2px solid currentColor;
            border-color: currentColor currentColor currentColor transparent;
            animation: lds-dual-ring 1.2s linear infinite;
        }
        @keyframes lds-dual-ring {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }
    </style>
</head>
<body>
    <!--=================================================================================
                                START PRELOADER
    ==================================================================================-->
    {{--  <div class="book_preload">
        <div class="book">
           <div class="book__page"></div>
           <div class="book__page"></div>
           <div class="book__page"></div>
        </div>
    </div>  --}}
    <!-- END PRELOADER -->
    <!--=================================================================================
                                Start Navbar Area
    ==================================================================================-->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
        <div class="container">
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                       <a class="nav-link js-scroll-trigger" href="#eduservices-home">الرئيسية</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#eduservices-course">من نحن</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#eduservices-why-choose-us">الخدمات</a>
                    </li>

                    <li class="nav-item">
                         <a class="nav-link js-scroll-trigger" href="#eduservices-testimonial">لماذا نحن</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#eduservices-teacher">تواصل معنا</a>
                    </li>
                </ul>
            </div>

            <a class="navbar-brand js-scroll-trigger" href="#page-top">
                <img src="{{ asset("assets/landing_assets/img/logo-al.png")}}" alt="logo">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
            </button>
        </div>
    </nav>
    <!--=================================================================================
                                Start Main Banner Area
    ==================================================================================-->
    <div id="eduservices-home" class="main-banner main-banner-show">
        <div class="d-table">
            <div class="d-table-cell">
                <div class="container">
                    <div class="row row-hero">
                        <div class="col-lg-6 col-md-12 reveal-left-fade">
                            <div class="hero-content">
                                <h1>
                                    أحمد المحلاوي،
                                </h1>
                                <p>
                                    مدرس فيزياء مختص في تقديم دروس الفيزياء لطلبة الثانوية العامة. بخبرة تتجاوز الـ10 سنوات في تدريس الفيزياء، أكرس جهودي لمساعدة الطلاب على فهم المفاهيم العلمية بطرق سهلة ومبسطة، تضمن تحقيق أفضل النتائج الأكاديمية.
                                </p>
                                <a href="#eduservices-contact" class="btn">ابدا التعلم</a>

                            </div>
                        </div>

                        <div class="col-lg-6 col-md-12 reveal-right-fade">
                            <div class="hero-video">
                                <img class="site-owner"
                                src="{{ asset("assets/landing_assets/img/journalist_online_3.webp")}}" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Main Banner Area -->

    <!--=================================================================================
                               Start About us
    ==================================================================================-->
    <section id="eduservices-about-us" class="boxes-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 wow fadeInUp" data-wow-delay=".2s">
                    <div class="single-box">
                        <i class="icofont-users-alt-3"></i>
                        <h3>من نحن</h3>
                        <p>
                            مرحبًا، أنا أحمد المحلاوي، مدرس فيزياء مختص في تقديم دروس الفيزياء لطلبة الثانوية العامة. بخبرة تتجاوز الـ10 سنوات في تدريس الفيزياء، أكرس جهودي لمساعدة الطلاب على فهم المفاهيم العلمية بطرق سهلة ومبسطة، تضمن تحقيق أفضل النتائج الأكاديمية.
                        </p>
                    </div>
                </div>

                <div class="col-lg-6 col-md-6 wow fadeInUp" data-wow-delay=".4s">
                    <div class="single-box">
                        <i class="icofont-automation"></i>
                        <h3>أهدافي كمدرس</h3>
                        <p>
                            مساعدة الطلاب على تحقيق أفضل النتائج في مادة الفيزياء<br>
                            تحفيز الشغف العلمي لدى الطلاب وتوجيههم نحو التفكير الإبداعي<br>
                            تقديم الدعم الأكاديمي والشخصي للطلاب لضمان تفوقهم ونجاحهم الأكاديمي
                        </p>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- End About US -->

    <!--=================================================================================
                                Start Courses Area
    ==================================================================================-->
    <section id="eduservices-course" class="courses-area ptb-100 bg-f9faff">
        <div class="container">
            <div class="section-title">
                <h2>ماذا نقدم</h2>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="tab">
                        <ul class="tabs">
                            <li>
                                <a href="#">
                                    <i class="icofont-black-board"></i>
                                    <br> حصص تفاعلية
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    <i class="icofont-ui-video-chat"></i>
                                    <br> فيديوهات شرح
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    <i class="icofont-database-locked"></i>
                                    <br> بنك أسئلة
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    <i class="icofont-tasks"></i>
                                    <br> إختبارات إلكترونية
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    <i class="icofont-book"></i>
                                    <br> كتب إلكترونية
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    <i class="icofont-black-board"></i>
                                    <br> مراجعة نهائية
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Courses Area -->

    <!--=================================================================================
            START WHY CHOOSE US
    ==================================================================================-->
    <section  class="why-choose-us">
        <div class="why-choose-us-wrapper-top">
            <div class="container">
                <div class="">
                    <!-- section-title -->
                    <h2>لماذا تختارنا</h2>
                    <p>
                        الفيزياء هي مفتاح فهم العالم من حولنا! لا تتردد، انضم إلى دروس مستر أحمد المحلاوي الآن!
                    </p>
                </div>
            </div>
        </div>
        <div class="why-choose-us-wrapper-bottom background-opacity">
            <div class="container">
                <div class="why-choose-options wow fadeInUp">
                    <div class="row">
                        <!-- End single item -->
                        <div class="col-lg-4 col-md-6">
                            <div class="single-choose">
                                <div class="single-choose-left ">
                                    <img src="{{ asset("assets/landing_assets/img/icons/logo-top-2.png")}}" alt="">
                                </div>
                                <div class="single-choose-right">
                                    <h3>
                                        مكتبة كتب <br> وفيديوهات تفاعلية
                                    </h3>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="single-choose">
                                <div class="single-choose-left ">
                                    <img src="{{ asset("assets/landing_assets/img/icons/logo-top-3.png")}}" alt="">
                                </div>
                                <div class="single-choose-right">
                                    <h3>خبرة 10 سنوات<br>فى مادة الفيزياء </h3>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6">
                            <div class="single-choose">
                                <div class="single-choose-left ">
                                    <img src="{{ asset("assets/landing_assets/img/icons/logo-top-1.png")}}" alt="">
                                </div>
                                <div class="single-choose-right">
                                    <h3>مراجعات شاملة <br> لليالى الامتحان</h3>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="single-choose">
                                <div class="single-choose-left ">
                                    <img src="{{ asset("assets/landing_assets/img/icons/logo-top-2.png")}}" alt="">
                                </div>
                                <div class="single-choose-right">
                                    <h3>اختبارات الكترونية <br> على كل جزء فى المنهج</h3>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="single-choose">
                                <div class="single-choose-left ">
                                    <img src="{{ asset("assets/landing_assets/img/icons/logo-top-3.png")}}" alt="">
                                </div>
                                <div class="single-choose-right">
                                    <h3>حصص تفاعلية <br>مع مستر أحمد </h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END WHY CHOOSE US -->

    <!--=================================================================================
                                Start Contact Area
    ==================================================================================-->
    <section class="contact_us">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-12">
                    <div class="">
                        <h3>
                            ابقى على تواصل معنا
                        </h3>
                        <ul>
                            <li>
                                <div class="wp-block-uagb-container uagb-block-d443ce5a">
                                    <div class="wp-block-uagb-icon-list uagb-block-708e07bb"><div class="uagb-icon-list__wrap">
                                        <div class="wp-block-uagb-icon-list-child uagb-block-e92cf94e">
                                            <span class="uagb-icon-list__label"><strong>فرع المنصورة: حى الجامعة اعلى توكيل سكودا للسيارات الدور الأول</strong></span>
                                        </div>

                                        <div class="wp-block-uagb-icon-list-child uagb-block-3b221f05">
                                            <span class="uagb-icon-list__label"><strong>رقم الهاتف: 01060000805</strong></span>
                                        </div>
                                        <div class="wp-block-uagb-icon-list-child uagb-block-b5b2d3ff">
                                            <span class="uagb-icon-list__label"><strong>مواعيد العمل: يوميًا&nbsp; من الساعة 10 صباحًا إلى الساعة 11 مساءًا</strong>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12">
                    <div class="form">
                        <form method="post" action="{{ route("contact_us") }}" class="contactForm" id="ajax-contact">
                            @csrf
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                        <label for="name" class="label">الاسم*</label>
                                        <input type="text" class="form-control" name="name" id="name"
                                        placeholder="اكتب اسمك">
                                    </div>
                                </div>

                                <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                        <label for="name" class="label">الاسم*</label>
                                        <input type="email" class="form-control" name="email" id="email"
                                        placeholder="اكتب البريد الالكترونى" autocomplete="off">
                                    </div>
                                </div>

                                <div class="col-lg-12 col-md-12">
                                    <div class="form-group">
                                        <label for="name" class="label">الاسم*</label>
                                        <input type="email" class="form-control" name="phone" id="phone"
                                        placeholder="رقم الهاتف" autocomplete="off">
                                    </div>
                                </div>

                                <div class="col-lg-12 col-md-12">
                                    <div class="form-group">
                                        <label for="name" class="label">الاسم*</label>
                                        <textarea name="message" class="form-control" cols="30" rows="4"
                                        name="message" id="message" placeholder="رسالتك" autocomplete="off"></textarea>
                                    </div>
                                </div>

                                <div class="col-lg-12 col-md-12">
                                    <button type="submit" class="contact-btn btn">
                                        ارسال
                                        <div class="lds-dual-ring" id="load"></div>
                                    </button>
                                    <!--Result notification -->
                                    <div id="error-message" class="text-center"></div>
                                    <div id="form-messages"></div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Contact Area -->

    <!-- download app -->
    <div id="download_app" class="pt-100">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-sm-12 d-flex flex-column justify-content-center">
                    <p class="mb-5">
                        حمل الابليكيشن وكنا من الاوائل مع مستر أحمد المحلاوى
                    </p>
                    <div class="row">
                        <div class="col-lg-6 col-sm-12">
                            <a href="#">
                                <img src="{{ asset("assets/landing_assets/img/playmarket.png") }}" alt="">
                            </a>
                        </div>
                        <div class="col-lg-6 col-sm-12">
                            <a href="#">
                                <img src="{{ asset("assets/landing_assets/img/appstore.png") }}" alt="">
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 col-sm-12">
                    <img src="{{ asset("assets/landing_assets/img/journalist_online_3.webp") }}" alt="">
                </div>
            </div>
        </div>
    </div>

    <!--=================================================================================
         START FOOTER
    ==================================================================================-->
    <footer id="eduservices-footer" class="footer">
        <div class="container text-center">
            <div class="row">
                <div class="col-md-12">
                    <div class="footer-wrapper">
                        <div class="section-subscribe section-subscribe-st">
                            <!-- Start Social icons -->
                            <ul class="social">
                                <li>
                                    <a href="https://www.facebook.com/profile.php?id=100074080566412">
                                        <i class="icofont-linkedin"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="https://www.facebook.com/profile.php?id=100074080566412">
                                        <i class="icofont-facebook"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="icofont-youtube-play"></i>
                                    </a>
                                </li>
                            </ul>
                            <!-- End Social icons -->
                            <div class="copyright">
                                <p style="text-align: center;">Copyright © 2024 <a href="http://ahmedgamal.eb2a.com/?i=1"> تم التصميم والتطوير بواسطة  أحمد جمال</a></p>
                            </div>""
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- End footer -->

    <!-- Scroll to top -->
    <div class="go-top"><i class="icofont-stylish-up"></i></div>

    <script src="{{ asset("assets/landing_assets/js/jquery.min.js")}}"></script>
    <script src="{{ asset("assets/landing_assets/js/jquery-ui.js")}}"></script>
    <script src="{{ asset("assets/landing_assets/js/popper.min.js")}}"></script>
    <script src="{{ asset("assets/landing_assets/js/bootstrap.min.js")}}"></script>
    <script src="{{ asset("assets/landing_assets/js/owl.carousel.min.js")}}"></script>
    <script src="{{ asset("assets/landing_assets/js/jquery.magnific-popup.min.js")}}"></script>
    <script src="{{ asset("assets/landing_assets/js/jquery.mixitup.min.js")}}"></script>
    <script src="{{ asset("assets/landing_assets/js/waypoints.min.js")}}"></script>
    <script src="{{ asset("assets/landing_assets/js/jquery.counterup.min.js")}}"></script>
    <script src="{{ asset("assets/landing_assets/js/jquery-contact.js")}}"></script>
    <script src="{{ asset("assets/landing_assets/js/jquery.ajaxchimp.min.js")}}"></script>
    <script src="{{ asset("assets/landing_assets/js/jquery.easing.min.js")}}"></script>
    <script src="{{ asset("assets/landing_assets/js/wow.min.js")}}"></script>
    <script src="{{ asset("assets/landing_assets/js/scrollreveal.min.js")}}"></script>
    <script src="{{ asset("assets/landing_assets/js/main.js")}}"></script>
    <script>
          //add class into header menu
          $(window).on('scroll',function() {
            if ($(this).scrollTop() > 20){
                $('.navbar-expand-lg').addClass("color-set");
                $('.navbar-brand img').attr('src', '{{ asset("assets/landing_assets/img/logo-al-removebg-preview.webp") }}');
            }
            else{
                $('.navbar-expand-lg').removeClass("color-set");
                $('.navbar-brand img').attr('src', '{{ asset("assets/landing_assets/img/logo-al-removebg-preview.webp") }}');
            }
        });

    </script>
</body>
</html>
