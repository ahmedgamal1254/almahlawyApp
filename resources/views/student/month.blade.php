@extends("student.layouts.master")

@section("title")
شهر {{ $data["month"]->month_name }}
@endsection

@section("content")
<div class="home-page">
    <div class="container">
        <div class="month-container">
            <!-- <div class="month-container-header">
                <h3>محتوى شهر أغسطس</h3>
            </div> -->
            <div class="month-content-container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="month-overview">
                            <div class="month-overview-card">
                                <div class="month-title">
                                    <div class="month-num">
                                        <span>{{ $data["month"]->month < 10 ? "0".$data["month"]->month:$data["month"]->month }} </span>
                                    </div>
                                    <div class="month-text">
                                        <h3> شهر {{ $data["month"]->month_name }} | {{ $data["month"]->month_description  }}</h3>
                                    </div>
                                </div>

                                <div class="course-progress">

                                    <div class="course-progress-info">
                                        <span>معدل إكتمال الشهر</span>
                                        <span class="course-persentage">
                                            {{ $data["percentage"] }}%</span>
                                    </div>

                                    <div class="course-progress-content">

                                        <div class="progress">
                                            <div class="inner-progress" style="width: {{ $data["percentage"] }}%"></div>
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 order-2 order-lg-1">

                        <div class="month-sta">
                            <div class="exp-statistics">
                                <div class="absence-chart">
                                    <div class="doughnut-chart">

                                        <div class="canvas">
                                            <canvas id="graph1"></canvas>
                                        </div>

                                        <div class="doughnut-text">
                                            <p class="user-stat-title">
                                                {{ $data["percentage"] }}%
                                            </p>
                                        </div>

                                    </div>

                                    <div class="chart-info">
                                        <p class="progress-arc-summary-title">
                                            التقدير العام
                                        </p>
                                        <p class="progress-arc-summary-subtitle">
                                            لشهر {{ round($data["count_correct_answers"]/$data["all_questions_count"],2)*100 }}%
                                        </p>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="courses-registered">
                            <div class="widget-box-title">احصائيات الشهر</div>
                            <div class="courses-registered-content">

                                <div class="courses-registered-preview">
                                    <a href="courses.html">
                                        <div class="media">
                                            <!-- <img src="images/s2.png" alt=""> -->
                                            <div class="media-body">
                                              <h5>الأسئلة</h5>
                                              <p class="complete">
                                                <span class="data-progress">{{ $data["count_correct_answers"] }}</span>
                                                /
                                                <span id="sum-vid-exam">{{ $data["all_questions_count"] }}</span>
                                            </p>
                                            </div>
                                        </div>
                                    </a>
                                    <span class="progress">
                                        <span class="inner-progress"
                                        style="width: {{ (round($data["count_correct_answers"]/$data["all_questions_count"],2)*100) }}%;"></span>
                                    </span>
                                </div>

                                <div class="courses-registered-preview">
                                    <a href="courses.html">
                                        <div class="media">
                                            <!-- <img src="images/s2.png" alt=""> -->
                                            <div class="media-body">
                                              <h5>دقائق المشاهدة</h5>
                                              <p class="complete">
                                                <span class="data-progress">{{ $data["minute_watched"] }}</span>
                                                /
                                                <span id="sum-vid-exam">{{ $data["video_duration"] }}</span>
                                            </p>
                                            </div>
                                          </div>
                                    </a>
                                    <span class="progress">
                                        <span class="inner-progress"
                                        style="width: {{ $data["minute_watched"]/$data["video_duration"] }}%;"></span>
                                    </span>
                                </div>

                                <div class="courses-registered-preview">
                                    <a href="courses.html">
                                        <div class="media">
                                            <!-- <img src="images/s2.png" alt=""> -->
                                            <div class="media-body">
                                              <h5>الكتب الإلكترونية</h5>
                                              <p class="complete">
                                                <span class="data-progress">{{ $data["book_viewed"] }}</span>
                                                /
                                                <span id="sum-vid-exam">{{ $data["books_count"] }}</span>
                                            </p>
                                            </div>
                                          </div>
                                    </a>
                                    <span class="progress">
                                        <span class="inner-progress" style="width: {{ (round($data["book_viewed"]/$data["books_count"],2)*100) }}%;"></span>
                                    </span>
                                </div>

                            </div>
                        </div>

                    </div>

                    <div class="col-lg-9 order-1 order-lg-2">
                        <div class="month-content">
                            @foreach ($data["lessons"] as $lesson)
                                <div class="month-content-card">

                                    <div class="month-content-card-title">
                                        <!-- <figure style="background-image: url()"></figure> -->
                                        <div class="card-icon">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-video"><polygon points="23 7 16 12 23 17 23 7"></polygon><rect x="1" y="5" width="15" height="14" rx="2" ry="2"></rect></svg>
                                        </div>
                                        <div class="month-content-card-info">
                                            <div class="upper-info">
                                                <span>فيديو شرح {{ $lesson->description }}</span>
                                                .
                                                {{-- <span>115 دقيقة</span> --}}
                                            </div>
                                            <h3>{{ $lesson->title }}</h3>
                                        </div>
                                    </div>

                                    <div class="month-content-card-action">
                                        <a href="{{ route("month_page_lessons.id",["teacher_id"=>$data["teacher_id"],
                                            "id"=>$data["month_id"],"lesson_id"=>$lesson->id]) }}" class="btn-transparent">عرض الفيديو</a>
                                    </div>

                                </div>
                            @endforeach

                            @foreach ($data["books"] as $book)
                               <div class="month-content-card">
                                <div class="month-content-card-title">
                                    <!-- <figure style="background-image: url()"></figure> -->
                                    <div class="card-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg"
                                        width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                         stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                         class="feather feather-book"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                                    </div>
                                    <div class="month-content-card-info">
                                        <div class="upper-info">
                                            <span>كتاب إلكترنى {{ $book->title }}</span>
                                        </div>
                                        <h3>{{ $book->description }}</h3>
                                    </div>
                                </div>

                                {{-- <div class="month-content-card-action">
                                    <a href="{{ route("month_page_book.id",["teacher_id"=>$data["teacher_id"]
                                        ,"month_id"=>$data["month"]->id,"id"=>$book->id]) }}" class="btn-transparent _df_button">
                                        فتح الكتاب
                                    </a>
                                </div> --}}
                                <div class="month-content-card-action">
                                    <div class="btn-transparent _df_button" source="{{ asset("public/app/books/".$book->media_url) }}">فتح الكتاب</div>
                                </div>
                               </div>
                            @endforeach

                            @foreach ($data["exams"] as $exam)
                                <div class="month-content-card opened-month-card">

                                    <div class="month-content-card-title">
                                        <!-- <figure style="background-image: url()"></figure> -->
                                        <div class="card-icon">
                                            {{ (round($data["count_correct_answers"]/$data["all_questions_student"],2)*100) }}%
                                        </div>
                                        <div class="month-content-card-info">
                                            <div class="upper-info">
                                                <span>اختبار الكتروني</span>
                                                .
                                                <span>{{ $exam->duration }} دقيقة</span>
                                                .
                                                <span>{{ $exam->cnt }} سؤال</span>
                                            </div>
                                            <h3>{{ $exam->title }}</h3>
                                        </div>
                                    </div>


                                    @isset($exam->degree)
                                    <div class="month-content-card-action">
                                        <a href="{{ route("exam_results",["teacher_id"=>$data["teacher_id"]
                                        ,"month_id"=>$data["month"]->id,"id"=>$exam->id]) }}"
                                            class="btn-transparent">
                                            عرض الاجابات
                                        </a>
                                    </div>
                                    @else
                                    <div class="month-content-card-action">
                                        <a href="{{ route("month_page_exam.id",["teacher_id"=>$data["teacher_id"]
                                        ,"month_id"=>$data["month"]->id,"id"=>$exam->id]) }}"
                                            class="btn-transparent">
                                            بدأ الامتحان
                                        </a>
                                    </div>
                                    @endisset

                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section("title_script")
<link href="{{ asset("assets/student_assets/dflip/css/dflip.min.css")}}" rel="stylesheet" type="text/css">
<link href="{{ asset("assets/student_assets/dflip/css/themify-icons.min.css")}}" rel="stylesheet" type="text/css">
@endsection

@section("script")
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.js"></script>
<script>
    var ctx = document.getElementById('graph1').getContext('2d');


    // Helper
    Chart.defaults.global.defaultFontFamily = "cairo";
    Chart.defaults.global.defaultFontSize = 15;

    var main = "#095bec";
    var sub = "#e8e8ef";

    var chart = new Chart(ctx, {

        // The type of chart
        type: 'doughnut',

        // The data for our dataset
        data: {
            labels: ["تم تحقيقة", "الباقي"],
            datasets: [{
                backgroundColor: [main, sub],
                data: [50, 20],
            }]
        },

        // Configuration options go here
        options: {
            cutoutPercentage: 83,
          legend: {
                display: false,
            },
        }
        });

    </script>
@endsection
