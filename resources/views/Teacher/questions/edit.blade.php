@extends("Teacher.layouts.main")

@section("title-header")
<p>تعديل سؤال {{ $question->name }}</p>
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
                                <form action="{{ route("question.update") }}" method="post" enctype="multipart/form-data">
                                    @csrf
                                    <input type="hidden" name="id" value="{{ $question->id }}">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <select name="type" class="form-control" id="type_question">
                                                <option value="">طريقة عرض السؤال</option>
                                                <option @if($question->type_question == "1") selected @endif value="1">صورة</option>
                                                <option @if($question->type_question == "2") selected @endif value="2">نص</option>
                                                <option @if($question->type_question == "3") selected @endif value="3">صورة ونص</option>
                                            </select>
                                            @error("type")
                                                <span class="text-error">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-6 type @if(!in_array($question->type_question,array(1,3))) d-none @endif" data-type="1">
                                        <div class="form-group">
                                            <label for="">رفع صورة للسؤال</label>
                                            <input type="file" class="form-control" onchange="loadFile(event)" name="img">
                                            <input type="hidden" name="old_image" value="{{ $question->img }}">
                                        </div>
                                        <img src="{{ asset("public/app/" . $question->img) }}" id="img_display" class="img-thumbnail img-fluid" alt="">
                                        @error("img")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </div>

                                    <div class="col-6 type @if(!in_array($question->type_question,array(2,3))) d-none @endif" data-type="2">
                                        <fieldset class="form-group position-relative has-icon-left mb-0">
                                            <input type="text" name="title"
                                                   class="form-control form-control-lg input-lg"
                                                   id="email" value="{{ $question->name }}" placeholder="أدخل عنوان السؤال">
                                        </fieldset>
                                        @error("title")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </div>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="desc">أدخل وصف السؤال</label>
                                        <textarea type="text" name="description" id="desc" cols="30" rows="10"
                                               class="form-control form-control-lg input-lg"
                                               value="" id="email" placeholder="أدخل وصف السؤال">{{ $question->description }}</textarea>

                                        @error("description")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>



                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="desc">أدخل نوع السؤال</label>
                                        <select name="type_question" id="" class="form-control form-control-lg">
                                            <option>أدخل عنصر</option>
                                            <option @if($question->type == "اختيارات") selected @endif value="اختيارات">اختيارات</option>
                                            <option @if($question->type == "مقالى") selected @endif value="مقالى">مقالى</option>
                                            <option @if($question->type == "صح وخطأ") selected @endif value="صح وخطأ">صخ وخطأ</option>
                                        </select>
                                        @error("type_question")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <div class="col-12 mt-2">
                                        <div id="chooses" class="row">
                                            @foreach (json_decode($question->chooses) as $index => $item)
                                                <div class="col-6">
                                                    <div class="form-group">
                                                        <fieldset class="form-group position-relative has-icon-left mb-0">
                                                            <label style="color: black;font-size:20px;margin-bottom:10px;">الاختيار {{ $index + 1}}</label>
                                                            <textarea type="text" name="chooses[]" id="desc" cols="30" rows="2"
                                                            class="form-control form-control-lg input-lg"
                                                            value="" id="email" placeholder="الاختيار رقم  {{ $index + 1 }}">{{ $item }}</textarea>
                                                        </fieldset>
                                                        @error("chooses[{{ $index }}]")
                                                            <span class="text-error">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                            @endforeach
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
                                                    @foreach (json_decode($question->chooses) as $item)
                                                        <option @if($item == $question->answer) selected @endif value="{{ $item }}">{{ $item }}</option>
                                                    @endforeach
                                                </select>
                                                @error("answer")
                                                    <span class="text-error">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>
                                    </div>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <input type="text" name="degree"
                                               class="form-control form-control-lg input-lg"
                                               value="{{ $question->degree }}" id="" placeholder="أدخل درجة سؤال ">
                                        @error("degree")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="desc">أدخل اسم المرحلة الدراسية</label>
                                        <select name="school_grade_id" id="school_grades" class="form-control form-control-lg">
                                            <option value="{{ $question->school_grade_id }}">أدخل اسم المرحلة الدراسية</option>
                                            @forelse ($school_grades as $school_grade)
                                                <option
                                                    @if($school_grade->id == $question->school_grade_id) selected @endif
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
                                        <label for="desc">أدخل اسم الوحدة الدراسية</label>
                                        <select name="unit_id" id="units" class="form-control form-control-lg">
                                            <option value="{{ $question->unit_id }}">أدخل اسم الوحدة الدراسية</option>
                                            @forelse ($units as $unit)
                                                <option
                                                    @if($unit->id == $question->unit_id) selected @endif
                                                    value="{{ $unit->id }}">{{ $unit->title }}</option>
                                            @empty
                                                <option value="0">لا توجد فصول (شابتر) دراسية بعد</option>
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

@section("script")
<script>
    var loadFile = function(event) {
            var output = document.getElementById('img_display');
            output.src = URL.createObjectURL(event.target.files[0]);
            output.onload = function() {
                URL.revokeObjectURL(output.src) // free memory
            }
        };

        let val=parseInt($(this).val())

        if(val == 3){
            $(".type").removeClass("d-none")
        }else{
            $(".type").addClass("d-none")
            $(`.type[data-type=${val}]`).removeClass("d-none")
        }

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
