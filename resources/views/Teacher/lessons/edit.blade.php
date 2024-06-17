@extends("Teacher.layouts.main")

@section("title-header")
<span>جميع الفيديوهات</span>
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
                                        <p>تعديل فيديو</p>
                                    </div>
                                    <div class="table-action">
                                        <div class="table-link table-link-">
                                            <a href="{{ route("lessons") }}" class="btn btn-primary">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                                                <span>جميع الفيديوهات</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <form action="{{ route("lesson.update") }}" method="post" enctype="multipart/form-data">
                                    @csrf
                                    <input type="hidden" name="id" value="{{ $lesson->id }}">
                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <input type="text" name="title"
                                               class="form-control form-control-lg input-lg"
                                               value="{{ $lesson->title }}" id="email" placeholder="أدخل اسم الدرس">
                                        @error("title")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="desc">أدخل وصف الدرس</label>
                                        <textarea type="text" name="description" id="desc" cols="30" rows="10"
                                            class="form-control form-control-lg input-lg"
                                            id="email" placeholder="أدخل وصف الدرس">{{ $lesson->description }}</textarea>
                                        @error("description")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <input type="number" name="duration"
                                            class="form-control form-control-lg input-lg"
                                            value="{{ $lesson->duration }}" placeholder="أدخل مدة الدرس(الفيديو) بالدقيقة">
                                        @error("duration")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="date_exam">وقت عرض الفيديو/الدرس</label>
                                        <small>أدحل الشهر والسنة المراد عرض فيهم الدرس</small>
                                        <input class="form-control form-control-lg" id="date_exam"
                                            value="{{ $lesson->date_show }}" name="date_show" type="date">
                                        @error("date_exam")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="">أرفع صورة مصغرة للفيديو</label>
                                        <input class="form-control form-control-lg" id="img" name="img" type="file">
                                        @error("img")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="desc">أدخل اسم المرحلة الدراسية</label>
                                        <select name="school_grade_id" id="school_grades" class="form-control form-control-lg">
                                            <option value="">أدخل اسم المرحلة الدراسية</option>
                                            @forelse ($school_grades as $school_grade)
                                                <option
                                                @if($lesson->school_grade_id == $school_grade->id) selected @endif
                                                value="{{ $school_grade->id }}">{{ $school_grade->name }}</option>
                                            @empty
                                                <option value="0">لا توجد مراحل دراسية بعد</option>
                                            @endforelse
                                        </select>
                                        @error("school_grade_id")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="desc">أدخل اسم الوحدة</label>
                                        <select name="unit_id" id="units" class="form-control form-control-lg">
                                            <option value="">أدخل اسم الوحدة</option>
                                            @forelse ($units as $unit)
                                                <option
                                                @if($lesson->unit_id == $unit->id) selected @endif
                                                value="{{ $unit->id }}">{{ $unit->title }}</option>
                                            @empty
                                                <option value="0">لا توجد مواد وحدات دراسية بعد</option>
                                            @endforelse
                                        </select>
                                        @error("unit_id")
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
