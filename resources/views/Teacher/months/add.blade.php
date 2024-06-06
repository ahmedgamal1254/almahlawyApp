@extends("Teacher.layouts.main")

@section("title-header")
<p>الشهور الدراسية</p>
@endsection

@section("content")
<div class="app-content content ">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper container-xxl p-0">

        <div class="content-body">
            <section class="bs-validation">
                <div class="row">
                    <div class="col-md-12 col-12">
                        <div class="card custom-form-elements">
                            <div class="table-parent">
                                <div class="table-header">
                                    <div class="table-name">
                                        <p> اضافة شهر جديد</p>
                                    </div>
                                    <div class="table-action">
                                        <div class="table-link table-link-">
                                            <a href="{{ route("show_months") }}" class="btn btn-primary">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                                                <span>جميع الاشهر</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <form action="{{ route("months.store") }}" method="post">
                                    @csrf

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="desc">أدخل محتوى الشهر</label>
                                        <textarea type="text" name="description" id="desc" cols="30" rows="10"
                                            class="form-control form-control-lg input-lg"
                                        id="email" placeholder="أدخل محتوى الشهر">{{ old("description") }}</textarea>
                                        @error("description")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="date_exam">أدحل التاريخ</label>
                                        <small>أدحل الشهر والسنة</small>
                                        <input class="form-control form-control-lg" id="date_exam" name="month" type="month">
                                        @error("month")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="date_exam">أدحل قيمة الشهر</label>
                                        <small>أدحل قيمة الشهر</small>
                                        <input class="form-control form-control-lg" placeholder="أدحل قيمة الشهر" name="cost" value="{{ old("cost") }}" type="text">
                                        @error("cost")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="date_exam">أدحل ترتيب الشهر</label>
                                        <small>أدحل ترتيب الشهر 1>2>3>4 ......</small>
                                        <input class="form-control form-control-lg" placeholder="أدحل ترتيب الشهر" name="orderValue"
                                        value="{{ old("orderValue") }}" type="number">
                                        @error("orderValue")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <div class="custom-form-elemrnt-button">
                                        <div class="row">
                                            <div class="col-12">
                                                <button type="submit" class="btn btn-primary">حفظ</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
@endsection
