@extends("Teacher.layouts.main")

@section("title-header")
<p>الاسئلة الدراسية</p>
@endsection

@section("content")
<div class="app-content content">
    <div class="container">
        {{-- <div class="table-header">الاسئلة الدراسية</div> --}}
        <div class="card" style="padding: 20px;">
            <form action="{{ route("search_questins") }}" method="get">
                <div class="row">
                    <div class="col-lg-6 col-sm-12 mb">
                        <select style="width: 100%;" name="school_grade" class="form-select form-control form-select-sm" id="search_school_grade" aria-label=".form-select-sm example">
                            <option selected value="0">اختر الصف الدراسى</option>
                            @forelse ($school_grades as $school_grade)
                                <option value="{{ $school_grade->id }}">{{ $school_grade->name }}</option>
                            @empty

                            @endforelse
                        </select>
                    </div>

                    <div class="col-lg-6 col-sm-12 mb">
                        <input class="form-control" name="name" list="datalistOptions" id="search" placeholder="أدحل اسم السؤال">
                    </div>

                    <div class="col-lg-6 col-sm-12">
                        <select style="width: 100%;" name="unit" class="form-select form-control form-select-sm" id="unit" aria-label=".form-select-sm example">
                            <option selected value="0">اختر الوحدة الدراسية</option>
                            @forelse ($units as $unit)
                                <option value="{{ $unit->id }}">{{ $unit->title }}</option>
                            @empty

                            @endforelse
                        </select>
                    </div>

                    <div class="col-6" style="margin-top: 15px;">
                        <button type="submit" class="btn btn-primary">تطبيق</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="row">
            <table class="table table-de mb-0">
                <thead class="table table-de mb-0 table-striped table-hover">
                    <tr>
                        <th>عنوان السؤال</th>
                        <th>صورة السؤال</th>
                        <th>احتيارات السؤال</th>
                        <th>الاجابة الصحيحة</th>
                        <th>الدرجة</th>
                        <th>اسم الوحدة</th>
                        <th>المرحلة الدراسية</th>
                        <th>التعديلات</th>
                    </tr>
                </thead>
                <tbody id="search_part">
                    @include("Teacher.questions.load")
                    <tr>
                        <td colspan="7" class="text-center" class="loader" id="qloader"></td>
                    </tr>
                </tbody>
            </table>

            <div class="row">
                <a href="{{ route("question.add") }}" class="btn btn-primary"><i class="fa fa-plus"></i> اضافة سؤال جديد</a>
            </div>

        </div>
        {{ $questions->links() }}
    </div>
</div>
@endsection

@section("script")
<script>
    $(document).ajaxStart(function() {
        $("#qloader").show();
    }).ajaxStop(function() {
        $("#qloader").hide('slow');
    });

    let baseurl="{{ env("APP_URL") }}"

    console.log(baseurl)

    document.getElementById("search_school_grade").addEventListener("change",function (){
        let val=document.getElementById("search_school_grade").value
        let unit=document.getElementById("unit").value

        let url
        if(unit>0){
            url=baseurl + "/eacher/question/search?"+"school_grade="+val+"&unit="+unit
        }else{
            url= baseurl + "/teacher/question/search?school_grade="+val
        }
        document.getElementById("search_part").innerHTML='';
        $.ajax({
            url:  url,
            type: 'get',
            success: function(data) {
                table_code=document.getElementById("search_part");
                document.getElementById("search").value=``

                table_code.innerHTML=`${data.data}`
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // Handle any errors
                console.log('Error:', textStatus, errorThrown);
            }
        });
    })

    document.getElementById("unit").addEventListener("change",function (){
        let val=document.getElementById("unit").value
        let school_grade=document.getElementById("search_school_grade").value

        let url
        if(school_grade>0){
            url=baseurl + "/teacher/question/search?"+"school_grade="+school_grade+"&unit="+val
        }else{
            url=baseurl + "/teacher/question/search?unit="+val
        }
        document.getElementById("search_part").innerHTML='';
        $.ajax({
            url:  url,
            type: 'get',
            success: function(data) {
                table_code=document.getElementById("search_part");
                document.getElementById("search").value=''
                table_code.innerHTML=`${data.data}`
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // Handle any errors
                console.log('Error:', textStatus, errorThrown);
            }
        });
    })

    document.getElementById("search").addEventListener("input",function (){
        let val=document.getElementById("search").value

        let school_grade=document.getElementById("search_school_grade").value
        let unit=document.getElementById("unit").value

        let url
        if(school_grade>0 & unit == 0){
            url= baseurl + "/teacher/question/search/name?name="+val+"&school_grade="+school_grade
        }else if(school_grade==0 & unit > 0){
            url= baseurl + "/teacher/question/search/name?name="+val+"&unit="+unit
        }else if(school_grade>0 & unit > 0){
            url= baseurl + "/teacher/question/search/name?name="+val+"&school_grade="+school_grade+"&unit="+unit
        }else{
            url=baseurl + "/teacher/question/search/name?name="+val
        }

        document.getElementById("search_part").innerHTML='';

        $.ajax({
            url:  url,
            type: 'get',
            success: function(data) {
                table_code=document.getElementById("search_part");

                table_code.innerHTML=`${data.data}`
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // Handle any errors
                console.log('Error:', textStatus, errorThrown);
            }
        });
    })
</script>
@endsection
