@extends("Teacher.layouts.main")

@section("title-header")
<p>اضافة امتحان جديد</p>
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
                                        <p>إضافة امتحان جديد</p>
                                    </div>
                                    <div class="table-action">
                                        <div class="table-link table-link-">
                                            <a href="{{ route("exams") }}" class="btn btn-primary">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                                                <span>جميع الامتحانات</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <form action="{{ route("exam.store") }}" method="post" enctype="multipart/form-data">
                                    @csrf
                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <input type="text" name="title"
                                               class="form-control form-control-lg input-lg"
                                               value="{{ old("title") }}" id="email" placeholder="أدخل عنوان الامتحان">
                                        @error("title")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="desc">أدخل وصف للا امتحان</label>
                                        <textarea type="text" name="description" id="desc" cols="30" rows="10"
                                               class="form-control form-control-lg input-lg"
                                               id="email" placeholder="أدخل وصف الامتحان">{{ old("description") }}</textarea>
                                        @error("description")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="desc">أدخل مدة الامتحان</label>
                                        <select name="duration" id="" class="form-control form-control-lg">
                                            <option value="30" @if(old("duration") == 30) selected @endif>30 دقيقة</option>
                                            <option value="15" @if(old("duration") == 15) selected @endif>15 دقيقة</option>
                                            <option value="45" @if(old("duration") == 45) selected @endif>45 دقيقة</option>
                                            <option value="60" @if(old("duration") == 60) selected @endif>60 دقيقة</option>
                                            <option value="90" @if(old("duration") == 90) selected @endif>90 دقيقة</option>
                                            <option value="120" @if(old("duration") == 120) selected @endif>120 دقيقة</option>
                                        </select>
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <input type="text" name="count_question"
                                               class="form-control form-control-lg input-lg"
                                               value="{{ old("count_question") }}" id="email" placeholder="أدخل عدد أسئلة الامتحان">
                                        @error("count_question")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="date_exam">وقت عرض الامتحان</label>
                                        <small>أدحل الشهر والسنة المراد عرض فيهم الامتحان</small>
                                        <input class="form-control form-control-lg" id="date_exam" value="{{ old("date_exam") }}"
                                        name="date_exam" type="date">
                                        @error("date_exam")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="time_start">ميعاد عرض الامتحان</label>
                                        <small>أدحل وقت بداية الامتحان</small>
                                        <input class="form-control form-control-lg" name="time_start" value="{{ old("time_start") }}"
                                         type="time">
                                        @error("time_start")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="time_end">ميعاد نهاية عرض الامتحان</label>
                                        <small>أدحل وقت انتهاء الامتحان</small>
                                        <input class="form-control form-control-lg" name="time_end"
                                        value="{{ old("time_end") }}" type="time">
                                        @error("tieme_end")
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

                                    <div class="mb-1">
                                        <div class="tags-input">
                                            <table class="table table-de mb-0 table-striped table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>رقم الفصل</th>
                                                        <th>اسم الفصل</th>
                                                        <th>عدد الاسئلة</th>
                                                        <th>العمليات</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="tags">
                                                    @if (is_array(old("units")))
                                                        @foreach (old("units") as $index => $unit)
                                                            @if(!empty($unit))
                                                            <tr>
                                                                <td>{{ $index }}</td>
                                                                <td> {{ \App\Models\Unit::find($unit["name"])->title }}
                                                                    @error("units.$index.name")
                                                                        <span class="text-error">{{ $message }}</span>
                                                                    @enderror

                                                                </td>
                                                                <td>
                                                                    <input type="number"
                                                                        class="form-control form-control-lg input-lg"
                                                                        placeholder="عدد الاسئلة" name="units[{{ $index }}][number]"
                                                                        value="{{ $unit["number"] }}">

                                                                    <input type="hidden"
                                                                        name="units[{{ $index }}][name]"
                                                                        value="{{ $unit["name"] }}">
                                                                    @error("units.$index.number")
                                                                        <span class="text-error">{{ $message }}</span>
                                                                    @enderror
                                                                </td>
                                                                <td>
                                                                    <button class="delete-button"><i class="fa fa-trash"></i></button>
                                                                </td>
                                                            </tr>
                                                            @endif
                                                        @endforeach
                                                    @endif
                                                </tbody>
                                            </table>


                                            <input type="hidden" name="unit" />
                                            <input type="text" id="input-tag" placeholder="ابحص باسم الوحدة" />
                                        </div>
                                        <select name="" id="units_exam" class="form-control form-control-lg">
                                            <option value="">أدخل اسم الوحدة</option>
                                            @forelse ($units as $unit)
                                                <option value="{{ $unit->title }}" data-id="{{ $unit->id }}">{{ $unit->title }}</option>
                                            @empty
                                                <option value="0">لا توجد وحدة دراسية بعد</option>
                                            @endforelse
                                        </select>
                                        @error("units")
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

                                    <div class="alert alert-danger" id="errors"></div>
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
    let url="{{ env("APP_URL") }}"

    // Get the tags and input elements from the DOM
    const tags = document.getElementById('tags');
    const input = document.getElementById('input-tag');
    const select = document.getElementById('units_exam');

    // Add an event listener for keydown on the input element
    let i=0;

    select.addEventListener('input', function (event) {
        // Create a new list item element for the tag
        const tag = document.getElementById("tags");

        const tagContent = select.value.trim();

        i+=1

        tag.innerHTML +=`
        <tr>
            <td>
                ${i}
            </td>
            <td>
                ${tagContent}
            </td>
            <td>
                <input type="number"
                    class="form-control form-control-lg input-lg"
                    placeholder="عدد الاسئلة" name="units[${i}][number]"
                    value="">

                <input type="hidden"
                    name="units[${i}][name]"
                    value="${this.options[this.selectedIndex].getAttribute("data-id")}">
            </td>
            <td>
                <span class="delete-button"><i class="fa fa-trash"></i></span>
            </td>
        </tr>
        `
        // Clear the input element's value
        input.value = '';
    });

    // Add an event listener for click on the tags list
    tags.addEventListener('click', function (event) {

        // If the clicked element has the class 'delete-button'
        if (event.target.classList.contains('delete-button')) {

            // Remove the parent element (the tag)
            parent=event.target.parentNode;
            parent.parentNode.remove()
        }

        if (event.target.classList.contains('fa-trash')) {

            // Remove the parent element (the tag)
            parent=event.target.parentNode;
            parent.parentNode.parentNode.remove()
        }
    });

    document.getElementById("input-tag").addEventListener("input",function (){
        val=document.getElementById("input-tag").value
        selection=document.getElementById("units_exam")
        selection.innerHTML=''
        selection.innerHTML+=`<option value="">اختر الفصل (الشابتر)</option>`

        $.ajax({
            url:  "/teacher/units/search?search="+val,
            type: 'get',
            success: function(data) {
                if(data["data"].length >0){
                    for(i=0;i<data["data"].length;i++){
                        selection.innerHTML+=`<option value="${data["data"][i].title}"
                        data-id="${data["data"][i].id}">${data["data"][i].title}</option>`
                    }
                }else{
                    select.innerHTML='لا توجد نتائج لعرضها'
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // Handle any errors
                console.log('Error:', textStatus, errorThrown);
            }
        });
    })

    var element = document.getElementById("school_grades");
    element.addEventListener('change', function (){
        var school_grade=document.getElementById("school_grades").value

        let units=document.getElementById("units_exam")
        units.innerHTML=""
        units.innerHTML+=`<option value="">اختر الفصل (الشابتر)</option>`

        $.ajax({
            url:  url + "/teachers/school_grade/" + school_grade + "/units",
            type: 'get',

            success: function(data) {
                console.log(data)

                data.forEach(ele => {
                    units.innerHTML+=`<option value="${ele.title}" data-id="${ele.id}">${ele.title}</option>`
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
