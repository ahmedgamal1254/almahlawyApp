@extends("Teacher.layouts.main")

@section("content")
<div class="app-content content">
    <div class="container">
        <div class="alert alert-primary p-2">الامتحانات الورقية</div>
        <form action="{{ route("teacher.paper-exams.update") }}" method="post" enctype="multipart/form-data">
            @csrf

            <input type="hidden" name="id" value="{{ $exam->id }}">
            <div class="row">
                <div class="col-12">
                    <fieldset class="form-group position-relative has-icon-left mb-0">
                        <label for="desc">اسم الطالب</label>
                        <input type="text" class="form-control" id="name_student" placeholder="search any">
                        <select name="user_id" id="select" class="form-control form-control-lg">
                            <option value="">اسم الطالب</option>
                            <option value="{{ $exam->user->id }}" selected>{{ $exam->user->name }}</option>
                        </select>
                        @error("user_id")
                            <span class="text-danger">{{ $message }}</span>
                        @enderror
                    </fieldset>
                </div>

                <div class="col-6">
                    <fieldset class="form-group position-relative has-icon-left mb-1 mt-1">
                        <label for="desc">درجة الطالب</label>
                        <input type="text" name="student_degree" class="form-control form-control-lg input-lg"
                        value="{{ $exam->student_degree }}" id="name" placeholder="أدخل درجة الطالب">
                        @error("student_degree")
                            <span class="text-danger">{{ $message }}</span>
                        @enderror
                    </fieldset>
                </div>

                <div class="col-6">
                    <fieldset class="form-group position-relative has-icon-left mb-1 mt-1">
                        <label for="desc">الدرجة الكلية</label>
                        <input type="text" name="total_degree" class="form-control form-control-lg input-lg"
                        value="{{ $exam->total_degree }}" id="name" placeholder="أدخل الدرجة الكلية">
                        @error("total_degree")
                            <span class="text-danger">{{ $message }}</span>
                        @enderror
                    </fieldset>
                </div>

                <div class="col-12">
                    <fieldset class="form-group position-relative has-icon-left mb-1">
                        <label for="">الامتحان فى صيغة pdf</label>
                        <input type="file" name="exam" class="form-control" id="pdf" onchange="loadFile(event)">
                        <embed src="{{ asset("app/" . $exam->exam) }}" style="width: 100%;height: 600px;" id="pdf_display">
                        @error("exam")
                            <span class="text-danger">{{ $message }}</span>
                        @enderror
                    </fieldset>
                </div>
            </div>
            <button type="submit" class="btn btn-primary mt-1">ارسال</button>
        </form>
    </div>
</div>
@endsection

@section('script')
    <script>
        let url="{{ env("APP_URL") }}"

        var loadFile = function(event) {
            var output = document.getElementById('pdf_display');
            output.src = URL.createObjectURL(event.target.files[0]);
            output.onload = function() {
                URL.revokeObjectURL(output.src) // free memory
            }
        };


        document.getElementById("name_student").addEventListener("input",function (){
            val=document.getElementById("name_student").value
            selection=document.getElementById("select")
            selection.innerHTML=''
            $.ajax({
                url:  url + "/teacher/users/search?search="+val,
                type: 'get',
                success: function(data) {
                    console.log(data)

                    if(data["users"].length >0){
                        for(i=0;i<data["users"].length;i++){
                            selection.innerHTML+=`<option value="${data["users"][i].id}"
                            data-id="${data["users"][i].id}">${data["users"][i].name}</option>`
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
