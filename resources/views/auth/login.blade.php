@extends('layouts.guest')

@section("title")
تسجيل دخول
@endsection

@section('content')
<div class="register" style="background-image: url(https://images.unsplash.com/photo-1661090790202-2f9173c66362?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80)">
    <div class="register-overlay"></div>

    <div class="row align-items-center">

        <div class="col-xl-6 col-lg-6 order-1 order-lg-2">
            <div class="register-content">
                <span class="wow bounceIn"></span>
                <h1><a href="{{ route("home") }}">فى أى مكان ... تعليمك مرن</a></h1>
                <p>مرن هى المنصة الأولى من نعها لتعليم اللغه العربية والانجليزية للمرحلة الثانوى فى مكان واحد بكل سهولة ومرونة</p>
                <div class="register-links">
                    <a href="{{ route("home") }}" class="register-home">العودة للرئيسية</a>
                </div>
            </div>
        </div>

        <div class="col-xl-6 col-lg-6 order-2 order-lg-1">
            <div class="form-container">
                <div class="form-card">
                    <div class="form-card-parent">

                        <div class="form-box-title">تسجيل الدخول</div>
                        <form action="{{ route("store_user") }}" class="form" method="POST">
                            @csrf
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>البريد الالكترونى</label>
                                        <input type="email" name="email" value="{{ old("email") }}" class="form-control">
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>كلمة المرور</label>
                                        <input type="password" name="password" minlength="8" class="form-control">
                                    </div>
                                </div>

                                @if ($errors->any())
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li class="text-danger"><span>{{ $error }}</span></li>
                                        @endforeach
                                    </ul>
                                @endif


                            </div>

                            <button type="submit" class="create-account-btn">تسجيل الدخول</button>
                        </form>
                        <span class="login-link"><a href="{{ route("register") }}">ليس لديك حساب ؟</a></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
