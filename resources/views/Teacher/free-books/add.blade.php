@extends("Teacher.layouts.main")

@section("title-header")
<p>الكتب الالكترونية</p>
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
                                        <p>اضافة كتاب جديد</p>
                                    </div>
                                    <div class="table-action">
                                        <div class="table-link table-link-">
                                            <a href="{{ route("free-books") }}" class="btn btn-primary">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                                                <span>جميع الكتب</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <form action="{{ route("free-book.store") }}" method="post" enctype="multipart/form-data">
                                    @csrf

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <input type="text" name="title"
                                               class="form-control form-control-lg input-lg"
                                               value="{{ old("title") }}" id="email" placeholder="أدخل اسم الكتاب او الملخص">

                                        @error("tilte")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="desc">أدخل وصف الكتاب او الملخص</label>
                                        <textarea type="text" name="description" id="desc" cols="30" rows="10"
                                               class="form-control form-control-lg input-lg"
                                               value="" id="email" placeholder="أدخل وصف الكتاب او الملخص">{{ old("description") }}</textarea>
                                        @error("description")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="pdf">أرفع صورة مصغرة الكتاب</label>
                                        <input class="form-control form-control-lg" id="img"
                                        name="img" type="file">
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
                                                @if(old("school_grade_id") == $school_grade->id) selected @endif
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
                                        <label for="desc">أدخل اسم الفصل (الشابتر) </label>
                                        <select name="unit_id" id="units" class="form-control form-control-lg">
                                            <option value="">أدخل اسم الفصل (الشابتر) </option>
                                            @forelse ($units as $unit)
                                                <option
                                                    @if(old("unit_id") == $unit->id) selected @endif
                                                    value="{{ $unit->id }}">{{ $unit->title }}</option>
                                            @empty
                                                <option value="0">لا يوجد محتوى بعد</option>
                                            @endforelse
                                        </select>

                                        @error("unit_id")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <button type="submit" class="btn btn-primary">ارسال</button>
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

@section('script')
    <script>
        let url="{{ env("APP_URL") }}"

        var element = document.getElementById("school_grades");
        element.addEventListener('change', function (){
            var school_grade=document.getElementById("school_grades").value

            let units=document.getElementById("units")
            units.innerHTML=""

            $.ajax({
                url:  url + "/teachers/school_grade/" + school_grade + "/units",
                type: 'get',

                success: function(data) {
                    console.log(data)

                    data.forEach(ele => {
                        units.innerHTML+=`<option value="${ele.id}">${ele.title}</option>`
                    });
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    // Handle any errors
                    console.log('Error:', textStatus, errorThrown);
                },
            });
        });
    </script>
@endsection
