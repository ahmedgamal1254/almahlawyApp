@extends("Teacher.layouts.main")

@section("title-header")
<p>اضافة سؤال جديد</p>
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
                                        <p>إضافة سؤال جديد</p>
                                    </div>
                                    <div class="table-action">
                                        <div class="table-link table-link-">
                                            <a href="{{ route("questions") }}" class="btn btn-primary">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                                                <span>جميع الاسئلة</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <form action="{{ route("question.store") }}" method="post" enctype="multipart/form-data">
                                    @csrf

                                    <div class="row">
                                        <h5 class="text-right">طريقة عرض السؤال</h5>

                                        <div class="col-12">
                                            <div class="form-group">
                                                <select name="type" class="form-control" id="type_question">
                                                    <option value="">طريقة عرض السؤال</option>
                                                    <option @if(old("type") == "1") selected @endif value="1">صورة</option>
                                                    <option @if(old("type") == "2") selected @endif value="2">نص</option>
                                                    <option @if(old("type") == "3") selected @endif value="3">صورة ونص</option>
                                                </select>
                                                @error("type")
                                                    <span class="text-error">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>

                                        <div class="col-6 type d-none" data-type="1">
                                            <div class="form-group">
                                                <label for="">رفع صورة للسؤال</label>
                                                <input type="file" class="form-control" onchange="loadFile(event)" name="img">
                                            </div>
                                            <img src="" id="img_display" class="img-thumbnail img-fluid" alt="">
                                            @error("img")
                                                <span class="text-error">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="col-6 type d-none" data-type="2">
                                            <fieldset class="form-group position-relative has-icon-left mb-0">
                                                <input type="text" name="title"
                                                       class="form-control form-control-lg input-lg"
                                                       id="title" value="{{ old("title") }}" placeholder="أدخل عنوان السؤال">
                                            </fieldset>
                                            @error("title")
                                                <span class="text-error">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="col-12">
                                            <fieldset class="form-group position-relative has-icon-left mb-0">
                                                <label for="desc">أدخل وصف السؤال</label>
                                                <textarea type="text" name="description" id="desc" cols="30" rows="5"
                                                    class="form-control form-control-lg input-lg"
                                                    id="email" placeholder="أدخل وصف السؤال">{{ old("description") }}</textarea>
                                                @error("description")
                                                    <span class="text-error">{{ $message }}</span>
                                                @enderror
                                            </fieldset>
                                        </div>

                                        <div class="col-12">
                                            <fieldset class="form-group position-relative has-icon-left mb-0">
                                                <label for="desc">أدخل نوع السؤال</label>
                                                <select name="type_question" id="" class="form-control form-control-lg">
                                                    <option
                                                        @if(old("type_question") == "اختيارات") selected @endif
                                                        value="اختيارات">اختيارات</option>
                                                    <option
                                                        @if(old("type_question") == "صح وخطأ") selected @endif
                                                        value="صح وخطأ">صخ وخطأ</option>
                                                </select>
                                                @error("type_question")
                                                    <span class="text-error">{{ $message }}</span>
                                                @enderror
                                            </fieldset>
                                        </div>

                                        <div class="col-12">
                                            <div class="form-geoup">
                                                <fieldset class="form-group position-relative has-icon-left mb-0">
                                                    <input type="text" name="num_of_questions"
                                                    class="form-control form-control-lg input-lg"
                                                    id="num_of_questions" value="{{ old("num_of_questions") }}" placeholder="أدخل عدد الاجوبة">
                                                </fieldset>
                                                @error("num_of_questions")
                                                    <span class="text-error">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>

                                        @error("chooses")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                        <div class="col-12 mt-2">
                                            <div id="chooses" class="row">
                                                @if (!is_Null(old("chooses")))
                                                    @foreach (old("chooses") as $index => $choose)
                                                        <div class="col-6">
                                                            <div class="form-group">
                                                                <fieldset class="form-group position-relative has-icon-left mb-0">
                                                                    <label style="color: black;font-size:20px;margin-bottom:10px;">الاختيار {{ $index + 1}}</label>
                                                                    <textarea type="text" name="chooses[]" id="desc" cols="30" rows="2"
                                                                    class="form-control form-control-lg input-lg"
                                                                    value="" id="email"
                                                                    placeholder="الاختيار رقم  {{ $index + 1 }}">{{ $choose }}</textarea>
                                                                </fieldset>
                                                                @error("chooses[{{ $index }}]")
                                                                    <span class="text-error">{{ $message }}</span>
                                                                @enderror
                                                            </div>
                                                        </div>
                                                    @endforeach
                                                @endif
                                            </div>
                                        </div>

                                        @if (Session::has("message"))
                                            <div class="alert alert-danger">{{ Session::get("message") }}</div>
                                        @endif

                                        <div class="col-12 mt-2 mb-2">
                                            <div class="select" id="correct_answer">
                                                <div class="from-group">
                                                    <select name="answer" class="form-control" id="">
                                                        <option value="">الاجابة الصحيحة</option>
                                                        @if (!is_Null(old("chooses")))
                                                            @foreach (old("chooses") as $item)
                                                                <option @if($item == old("answer")) selected @endif value="{{ $item }}">{{ $item }}</option>
                                                            @endforeach
                                                        @endif
                                                    </select>
                                                    @error("answer")
                                                        <span class="text-error">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-6">
                                            <fieldset class="form-group position-relative has-icon-left mb-0">
                                                <input type="text" name="degree"
                                                       class="form-control form-control-lg input-lg"
                                                       value="{{ old("degree") }}" id="" placeholder="أدخل درجة سؤال ">
                                            </fieldset>
                                            @error("degree")
                                                <span class="text-error">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="col-6"></div>

                                        <div class="col-6">
                                            <fieldset class="form-group position-relative has-icon-left mb-0">
                                                <label for="desc">أدخل اسم المرحلة الدراسية</label>
                                                <select name="school_grade_id" id="" class="form-control form-control-lg">
                                                    <option value="">أدخل اسم المرحلة الدراسية</option>
                                                    @forelse ($school_grades as $school_grade)
                                                        <option
                                                            @if($school_grade->id == old("school_grade_id")) selected @endif
                                                            value="{{ $school_grade->id }}">{{ $school_grade->name }}</option>
                                                    @empty
                                                        <option value="0">لا توجد مراحل دراسية بعد</option>
                                                    @endforelse
                                                </select>
                                            </fieldset>
                                            @error("school_grade_id")
                                                <span class="text-error">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="col-6">
                                            <fieldset class="form-group position-relative has-icon-left mb-0">
                                                <label for="desc">أدخل اسم الوحدة الدراسية</label>
                                                <select name="unit_id" id="" class="form-control form-control-lg">
                                                    <option value="">أدخل اسم الوحدة الدراسية</option>
                                                    @forelse ($units as $unit)
                                                        <option
                                                            @if($unit->id == old("unit_id")) selected @endif
                                                            value="{{ $unit->id }}">{{ $unit->title }}</option>
                                                    @empty
                                                        <option value="0">لا توجد مواد دراسية بعد</option>
                                                    @endforelse
                                                </select>
                                            </fieldset>
                                            @error("unit_id")
                                                <span class="text-error">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <div class="custom-form-elemrnt-button">
                                            <div class="row">
                                                <div class="col-12">
                                                    <button type="submit" class="btn btn-primary">حفظ</button>
                                                </div>
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

@section("script")
    <script>
        $("#num_of_questions").on("keyup",function (){
            $("#chooses").html("");

            $("#correct_answer").html("")

            $("#correct_answer").append("<select name='answer' class='form-control'>")

            for (let index = 0; index < $(this).val(); index++) {
                $("#chooses").append(`
                <div class="col-6">
                    <div class="form-group">
                        <fieldset class="form-group position-relative has-icon-left mb-0">
                            <label style="color: black;font-size:20px;margin-bottom:10px;">الاختيار ${index + 1}</label>
                            <textarea type="text" name="chooses[${index}]" id="desc" cols="30" rows="2"
                            class="form-control form-control-lg input-lg"
                            value="" id="email" placeholder="الاختيار رقم  ${index + 2}">{{ old("chooses[index]") }}</textarea>
                        </fieldset>
                    </div>
                </div>
                `)

                $("select[name='answer']").append(`<option value='${index}'>الاختيار ${index + 1}</option>`);
            }

            $("#correct_answer").append("</select>")

        })

        $("#type_question").on("change",function (){
            let val=parseInt($(this).val())

            if(val == 3){
                $(".type").removeClass("d-none")
            }else{
                $(".type").addClass("d-none")
                $(`.type[data-type=${val}]`).removeClass("d-none")
            }
        })

        var loadFile = function(event) {
            var output = document.getElementById('img_display');
            output.src = URL.createObjectURL(event.target.files[0]);
            output.onload = function() {
                URL.revokeObjectURL(output.src) // free memory
            }
        };

        let val=parseInt($("#type_question").val())

        if(val == 3){
            $(".type").removeClass("d-none")
        }else{
            $(".type").addClass("d-none")
            $(`.type[data-type=${val}]`).removeClass("d-none")
        }
    </script>
    <script src="https://editor.codecogs.com/eqneditor.api.min.js" crossorigin="anonymous"></script>
    <script>
        var ta = new EqEditor.TextArea('title', true);
    </script>
@endsection
