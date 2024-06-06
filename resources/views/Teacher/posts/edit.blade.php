@extends("Teacher.layouts.main")

@section("title-header")
<p>تعديل منشور {{ $post->title }}</p>
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
                                <form action="{{ route("post.update") }}" method="post">
                                    @csrf
                                    <input type="hidden" name="id" value="{{ $post->id }}">
                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <input type="text" name="title"
                                               class="form-control form-control-lg input-lg"
                                               value="{{ $post->title }}" id="email" placeholder="أدخل اسم المادة">
                                        <div class="form-control-position">
                                            <i class="fa fa-school"></i>
                                        </div>

                                        <span class="text-danger"> </span>

                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="desc">أدخل وصف المادة</label>
                                        <textarea type="text" name="description" id="desc" cols="30" rows="10"
                                               class="form-control form-control-lg input-lg"
                                               id="email" placeholder="أدخل وصف الماد">{{ $post->description }}</textarea>

                                        <span class="text-danger"> </span>

                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0" style="margin:50px 0px;">
                                        @if ($post->image_url)
                                        <img src="http://teacher-app.test:90/app/public/{{ $post->image_url }}" width="200" height="200" alt="" srcset="">
                                        @endif
                                        <br>
                                        <label for="img">تعديل صورة للبوست</label>
                                        <input class="form-control form-control-lg" id="img" name="img" type="file">

                                        <span class="text-danger"> </span>

                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="desc">أدخل اسم المرحلة الدراسية</label>
                                        <select name="school_grade_id" id="" class="form-control form-control-lg">
                                            <option value="{{ $post->school_grade_id }}">أدخل اسم المرحلة الدراسية</option>
                                            @forelse ($school_grades as $school_grade)
                                            <option value="{{ $school_grade->id }}">{{ $school_grade->name }}</option>
                                            @empty
                                            <option value="0">لا توجد مراحل دراسية بعد</option>
                                            @endforelse
                                        </select>

                                        <span class="text-danger"> </span>

                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="desc">أدخل اسم المادة الدراسية</label>
                                        <select name="subject_id" id="" class="form-control form-control-lg">
                                            <option value="{{ $post->subject_id }}">أدخل اسم المادة الدراسية</option>
                                            @forelse ($subjects as $subject)
                                            <option value="{{ $subject->id }}">{{ $subject->title }}</option>
                                            @empty
                                            <option value="0">لا توجد مواد دراسية بعد</option>
                                            @endforelse
                                        </select>

                                        <span class="text-danger"> </span>

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
