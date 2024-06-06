@extends("Teacher.layouts.main")

@section("title-header")
<p>الامتحانات</p>
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
                                        <p>تعديل بيانات امتحان</p>
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
                                <form action="{{ route("exam.update") }}" method="post" enctype="multipart/form-data">
                                    @csrf
                                    <input type="hidden" value="{{ $exam->id }}" name="id">
                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <input type="text" name="title"
                                               class="form-control form-control-lg input-lg"
                                               value="{{ $exam->title }}" id="email" placeholder="أدخل عنوان الامتحان">
                                        @error("title")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="desc">أدخل وصف للا امتحان</label>
                                        <textarea type="text" name="description" id="desc" cols="30" rows="10"
                                               class="form-control form-control-lg input-lg"
                                               id="email" placeholder="أدخل وصف الامتحان">{{ $exam->description }}</textarea>
                                        @error("description")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <input type="text" name="code"
                                               class="form-control form-control-lg input-lg"
                                               value="{{ $exam->code }}" id="" placeholder="أدخل كود الامتحان">
                                        @error("code")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="desc">أدخل مدة الامتحان</label>
                                        <select name="duration" id="" class="form-control form-control-lg">
                                            <option value="">أدخل مدة الامتحان</option>
                                            <option value="30" @if($exam->duration == 30) selected @endif>30 دقيقة</option>
                                            <option value="15" @if($exam->duration == 15) selected @endif>15 دقيقة</option>
                                            <option value="45" @if($exam->duration == 45) selected @endif >45 دقيقة</option>
                                            <option value="60" @if($exam->duration == 60) selected @endif>60 دقيقة</option>
                                            <option value="90" @if($exam->duration == 90) selected @endif>90 دقيقة</option>
                                            <option value="120" @if($exam->duration == 120) selected @endif>120 دقيقة</option>
                                        </select>
                                        @error("duration")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="date_show">وقت عرض الامتحان</label>
                                        <small>أدحل الشهر والسنة المراد عرض فيهم الامتحان</small>
                                        <input class="form-control form-control-lg" value="{{ $exam->date_exam }}" id="date_show"
                                        name="date_exam" type="date">
                                        @error("date_exam")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="date_show">ميعاد عرض الامتحان</label>
                                        <small>أدحل وقت بداية الامتحان</small>
                                        <input class="form-control form-control-lg" value="{{ $exam->start_time }}"
                                        id="date_show" name="start_time" type="time">
                                        @error("start_time")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="date_show">ميعاد نهاية عرض الامتحان</label>
                                        <small>أدحل وقت انتهاء الامتحان</small>
                                        <input class="form-control form-control-lg" value="{{ $exam->end_time }}"
                                        id="date_show" name="end_time" type="time">
                                        @error("end_time")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="desc">أدخل اسم المرحلة الدراسية</label>
                                        <select name="school_grade_id" id="" class="form-control form-control-lg">
                                            <option value="">أدخل اسم المرحلة الدراسية</option>
                                            @forelse ($school_grades as $school_grade)
                                            <option
                                                @if($exam->school_grade_id == $school_grade->id) selected @endif
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
                                            <ul id="tags">
                                                @foreach ($units as $unit)
                                                    <li>
                                                        {{ $unit->title }}
                                                        <input type="hidden" name="unit[]" value="{{ $unit->id }}">
                                                    </li>
                                                @endforeach
                                            </ul>
                                            <input type="text" id="input-tag"
                                                placeholder="ابحص باسم الوحدة" />
                                        </div>
                                        <select name="" id="select" multiple class="form-control form-control-lg">
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
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            @if ($errors->any())
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif
        </div>
    </div>
</div>
@endsection

@section("content")
<script>
    // Get the tags and input elements from the DOM
    const tags = document.getElementById('tags');
    const input = document.getElementById('input-tag');
    const select = document.getElementById('select');

    // Add an event listener for keydown on the input element
    select.addEventListener('change', function (event) {
        // Create a new list item element for the tag
        const tag = document.createElement('li');

        const tagContent = select.value.trim();

        tag.innerText = tagContent;
        tag.innerHTML += `<input type="hidden"
        value="${this.options[this.selectedIndex].getAttribute("data-id")}"
         name="unit_${this.options[this.selectedIndex].getAttribute("data-id")}" />`;
        // Add a delete button to the tag
        tag.innerHTML += '<button class="delete-button">X</button>';

        // Append the tag to the tags list
        tags.appendChild(tag);

        // Clear the input element's value
        input.value = '';

    });

    // Add an event listener for click on the tags list
    tags.addEventListener('click', function (event) {

        // If the clicked element has the class 'delete-button'
        if (event.target.classList.contains('delete-button')) {

            // Remove the parent element (the tag)
            event.target.parentNode.remove();
        }
    });

    document.getElementById("input-tag").addEventListener("input",function (){
        val=document.getElementById("input-tag").value
        selection=document.getElementById("select")
        selection.innerHTML=''
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
</script>
@endsection
