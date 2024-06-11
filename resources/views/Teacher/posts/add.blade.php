@extends("Teacher.layouts.main")

@section("title-header")
<p>المنشورات</p>
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
                                        <p>إضافة منشور جديد</p>
                                    </div>
                                    <div class="table-link table-link-">
                                        <a href="{{ route("class") }}" class="btn btn-primary">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-layout"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><line x1="3" y1="9" x2="21" y2="9"></line><line x1="9" y1="21" x2="9" y2="9"></line></svg>
                                            <span>جميع المنشورات</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <form action="{{ route("post.store") }}" method="post" enctype="multipart/form-data">
                                    @csrf
                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <input type="text" name="title"
                                               class="form-control form-control-lg input-lg"
                                               value="{{ old("title") }}" id="email" placeholder="أدخل عنوان البوست">
                                        @error("title")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="desc">أدخل وصف المنشور</label>
                                        <textarea type="text" name="description" id="desc" cols="30" rows="10"
                                               class="form-control form-control-lg input-lg"
                                               value="{{ old("description") }}" id="email" placeholder="أدخل وصف البوست"></textarea>
                                        @error("description")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="img">أرفع صورة للبوست</label>
                                        <input class="form-control form-control-lg" id="img" name="img" type="file">

                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="desc">أدخل اسم المرحلة الدراسية</label>
                                        <select name="school_grade_id" id="school_grades" class="form-control form-control-lg">
                                            <option value="">أدخل اسم المرحلة الدراسية</option>
                                            @forelse ($school_grades as $school_grade)
                                            <option value="{{ $school_grade->id }}">{{ $school_grade->name }}</option>
                                            @empty
                                            <option value="0">لا توجد مراحل دراسية بعد</option>
                                            @endforelse
                                        </select>
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="desc">أدخل اسم المادة الدراسية</label>
                                        <select name="unit_id" id="units" class="form-control form-control-lg">
                                            <option value="">أدخل اسم المادة الدراسية</option>
                                            @forelse ($units as $unit)
                                            <option value="{{ $unit->id }}"
                                                @if(old("unit_id") == $unit->id) @endif
                                                >{{ $unit->title }}</option>
                                            @empty
                                                <option value="0">لا توجد فصول دراسية بعد</option>
                                            @endforelse
                                        </select>
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
