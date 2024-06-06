@extends("student.layouts.master")

@section("title")
الشهور
@endsection

@section("content")
<div class="home-page">
    <div class="container">
        <div class="month-container">
            <div class="month-container-header">
                <h3>الشهور الدراسية</h3>
            </div>
            <div class="row">
                @foreach ($months as $month)
                <div class="col-lg-4 col-md-6">
                    <div class="month-card">
                        @isset($month->lock)
                        <a href="{{ route("month_page",["id"=>$month->id,"teacher_id"=>$teacher->id]) }}">
                            <div class="month-title">
                                <div class="month-num" style="background-image: url(https://img.freepik.com/free-vector/gradient-grainy-gradient-texture-wallpaper_23-2148968683.jpg?w=1380&t=st=1694212906~exp=1694213506~hmac=e5beb84a50b42d590dad326806751113dd529b1052f1dbf0d196f08e874e7104)">
                                    <span>{{ $month->month<10?"0".$month->month:$month->month }}</span>
                                </div>
                                <div class="month-text">
                                    <p>شهر {{ $month->month_name }}</p>
                                    <h3>{{ $month->month_description }}</h3>
                                </div>
                            </div>
                        </a>
                        @else
                        <a href="" onclick="return false;">
                            <div class="month-title">
                                <div class="month-num" style="background-image: url(https://img.freepik.com/free-vector/gradient-grainy-gradient-texture-wallpaper_23-2148968683.jpg?w=1380&t=st=1694212906~exp=1694213506~hmac=e5beb84a50b42d590dad326806751113dd529b1052f1dbf0d196f08e874e7104)">
                                    <span>{{ $month->month<10?"0".$month->month:$month->month }}</span>
                                </div>
                                <div class="month-text">
                                    <p>شهر {{ $month->month_name }}</p>
                                    <h3>{{ $month->month_description }}</h3>
                                </div>
                            </div>
                        </a>
                        @endisset

                        <div class="month-numbers">

                            <div class="month-num-part">
                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-video"><polygon points="23 7 16 12 23 17 23 7"></polygon><rect x="1" y="5" width="15" height="14" rx="2" ry="2"></rect></svg>
                                <span class="month-num-part-num">{{ $month->lesson_count }}</span>
                                <span class="month-num-part-title">فيديوهات</span>
                            </div>

                            <div class="month-num-part">
                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                                <span class="month-num-part-num">{{ $month->exam_count }}</span>
                                <span class="month-num-part-title">امتحانات</span>
                            </div>

                            <div class="month-num-part">
                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-book"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                                <span class="month-num-part-num">{{ $month->book_count }}</span>
                                <span class="month-num-part-title">كتب</span>
                            </div>

                        </div>

                        <div class="course-progress">
                            @isset($month->lock)
                            <span class="course-persentage"></span>
                            <div class="progress">
                                <div class="inner-progress"></div>
                            </div>

                            <div hidden class="course-score">
                                <p><span class="course-total-score">16</span><span>/</span><span class="course-score-number">10</span></p>
                            </div>
                            @else

                            @endisset

                        </div>

                        @isset($month->lock)
                            {{-- <div class="month-card-action">
                                {{-- <div class="fa-solid fa-unlock lock">شراء الشهر بـ 150 جنية</div> --}}
                            {{-- </div>  --}}
                        @else
                            <div class="month-card-action">
                                <div class="fa-solid fa-unlock lock" data-id="{{ $month->id }}"
                                data-teacher_id="{{ $teacher->id }}">شراء الشهر بـ {{ $month->cost }} جنية</div>
                            </div>
                        @endisset
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </div>
</div>
@endsection

@section("script")
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    var icons = document.getElementsByClassName("lock");
    Array.from(icons).forEach(function(element) {
      element.addEventListener('click', function (){
        var month_id=element.getAttribute("data-id");
        var teacher_id=element.getAttribute("data-teacher_id");

        url=''
        if(month_id == null && teacher_id == null){
            url="/Teacher-Production/dashboard/unlock"
        }else{
            url="/Teacher-Production/dashboard/unlock?month_id="+month_id+"&teacher_id="+teacher_id
        }

        var sure=window.confirm("أنت على وشك شراء محتوى هذا الشهر ");
        if(sure == true){
            $.ajax({
                url: url,
                type: 'GET',
                success: function(data) {
                    if(data["swal"] == "swal2-success"){
                        // element.classList.remove("fa-lock")
                        // element.classList.add("fa-unlock")

                        // document.getElementById("active_points").innerHTML=data["points"];
                        swal(data["msg"]);
                        document.getElementsByClassName("swal2-success")[0].style.display="block"
                    }else if(data["swal"] == "swal2-error"){
                        swal(data["msg"]);
                        document.getElementsByClassName("swal2-error")[0].style.display="block"
                    }else if(data["swal"] == "swal2-info"){
                        swal(data["msg"]);
                        document.getElementsByClassName("swal2-info")[0].style.display="block"
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    // Handle any errors
                    console.log('Error:', textStatus, errorThrown);
                }
            });
        }else{
            swal("تم الغاء الشراء بنجاح");
        }
      });
    });
</script>
@endsection
