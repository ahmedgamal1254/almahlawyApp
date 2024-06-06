@extends("student.layouts.master")

@section("title")
الفيديوهات والدروس
@endsection

@section("content")
<div class="home-page">
    <div class="container">
        <div class="month-container">
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
                                    {{-- <span>معدل إكتمال الشهر</span>
                                    <span class="course-persentage">76%</span> --}}
                                </div>

                                <div class="course-progress-content">

                                    {{-- <div class="progress">
                                        <div class="inner-progress" style="width: 76%"></div>
                                    </div> --}}

                                </div>

                            </div>

                        </div>
                    </div>
                </div>

                {{-- <div class="col-lg-3 order-2 order-lg-1">

                    {{-- <div class="month-sta">
                        <div class="exp-statistics">
                            <div class="absence-chart">
                                <div class="doughnut-chart">

                                    <div class="canvas">
                                        <canvas id="graph1"></canvas>
                                    </div>

                                    <div class="doughnut-text">
                                        <p class="user-stat-title">68%</p>
                                    </div>

                                </div>

                                <div class="chart-info">
                                    <p class="progress-arc-summary-title">
                                        التقدير العام
                                    </p>
                                    <p class="progress-arc-summary-subtitle">
                                        لشهر أغسطس
                                    </p>
                                </div>

                            </div>
                        </div>
                    </div> --}}

                    {{-- <div class="courses-registered">
                        <div class="widget-box-title">احصائيات الشهر</div>
                        <div class="courses-registered-content">

                            <div class="courses-registered-preview">
                                <a href="courses.html">
                                    <div class="media">
                                        <!-- <img src="images/s2.png" alt=""> -->
                                        <div class="media-body">
                                          <h5>الأسئلة</h5>
                                          <p class="complete">
                                            <span class="data-progress">471</span>
                                            /
                                            <span id="sum-vid-exam">620</span>
                                        </p>
                                        </div>
                                    </div>
                                </a>
                                <span class="progress">
                                    <span class="inner-progress" style="width: 74%;"></span>
                                </span>
                            </div>

                            <div class="courses-registered-preview">
                                <a href="courses.html">
                                    <div class="media">
                                        <!-- <img src="images/s2.png" alt=""> -->
                                        <div class="media-body">
                                          <h5>دقائق المشاهدة</h5>
                                          <p class="complete">
                                            <span class="data-progress">680</span>
                                            /
                                            <span id="sum-vid-exam">2120</span>
                                        </p>
                                        </div>
                                      </div>
                                </a>
                                <span class="progress">
                                    <span class="inner-progress" style="width: 44%;"></span>
                                </span>
                            </div>

                            <div class="courses-registered-preview">
                                <a href="courses.html">
                                    <div class="media">
                                        <!-- <img src="images/s2.png" alt=""> -->
                                        <div class="media-body">
                                          <h5>الكتب الإلكترونية</h5>
                                          <p class="complete">
                                            <span class="data-progress">9</span>
                                            /
                                            <span id="sum-vid-exam">14</span>
                                        </p>
                                        </div>
                                      </div>
                                </a>
                                <span class="progress">
                                    <span class="inner-progress" style="width: 65%;"></span>
                                </span>
                            </div>

                        </div>
                    </div> --}}

                </div>

                <div class="col-lg-12 order-1 order-lg-2">
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
