@extends("Teacher.layouts.main")

@section("title-header")
<div>الصفوف الدراسية</div>
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
                                        <p>إضافة صف جديد</p>
                                    </div>

                                    <div class="table-action">

                                        <div class="table-link table-link-">
                                            <a href="{{ route("school_grade") }}" class="btn btn-primary">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-layout"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><line x1="3" y1="9" x2="21" y2="9"></line><line x1="9" y1="21" x2="9" y2="9"></line></svg>
                                                <span>جميع الصفوف</span>
                                            </a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <form action="{{ route("school_grade.store") }}" method="post">
                                    @csrf
                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <input type="text" name="name"
                                            class="form-control form-control-lg input-lg"
                                            value="{{ old("name") }}" id="email" placeholder="أدخل اسم المرحلة">
                                        @error("name")
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="desc">أدخل وصف المرحلة</label>
                                        <textarea type="text" name="description" id="desc" cols="30" rows="10"
                                            class="form-control form-control-lg input-lg"
                                            id="email" placeholder="أدخل وصف المرحلة">{{ old("description") }}</textarea>
                                        @error("description")
                                            <span class="text-danger">{{ $message }}</span>
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
