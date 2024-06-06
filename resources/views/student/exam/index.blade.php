@extends("student.layouts.master")

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
                                        <span class="course-persentage">76%</span>
                                    </div>

                                    <div class="course-progress-content">

                                        <div class="progress">
                                            <div class="inner-progress" style="width: 76%"></div>
                                        </div>

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

                            @foreach ($data["exams"] as $exam)
                                <div class="month-content-card opened-month-card">

                                    <div class="month-content-card-title">
                                        <!-- <figure style="background-image: url()"></figure> -->
                                        <div class="card-icon">
                                            86%
                                        </div>
                                        <div class="month-content-card-info">
                                            <div class="upper-info">
                                                <span>اختبار الكتروني</span>
                                                .
                                                <span>{{ $exam->duration }} دقيقة</span>
                                                .
                                                <span>{{ $exam->cnt }} سؤال</span>
                                            </div>
                                            <h3>{{ $exam->description }}</h3>
                                        </div>
                                    </div>

                                    @if (Carbon\Carbon::parse(date("y:m:d"))->toDateString() == Carbon\Carbon::parse($exam->date_exam)->toDateString())
                                        @if (
                                        (Carbon\Carbon::parse(date("h:i"))->addHours(1)->format("h:i") >= Carbon\Carbon::parse($exam->start_time)->format("h:i"))
                                        and (Carbon\Carbon::parse(date("h:i"))->addHours(1)->format("h:i") < Carbon\Carbon::parse($exam->end_time)->format("h:i"))
                                        )
                                        <div class="month-content-card-action">
                                            <a href="{{ route("month_page_exam.id",["teacher_id"=>$data["teacher_id"]
                                            ,"month_id"=>$data["month"]->id,"id"=>$exam->id]) }}"
                                                class="btn-transparent">
                                                بدأ الامتحان
                                            </a>
                                        </div>
                                    @elseif (Carbon\Carbon::parse(date("h:i"))->addHours(1)->format("h:i") > Carbon\Carbon::parse($exam->end_time)->format("h:i"))
                                        <div class="month-content-card-action">
                                            <a href="{{ route("exam_results",["id"=>$exam->id,"teacher_id"=>$data["teacher_id"]
                                                ,"month_id"=>$data["month"]->id]) }}" class="btn-transparent">
                                                عرض الاجابات
                                            </a>
                                        </div>
                                    @else
                                        <span>
                                            <div class="month-content-card-action">
                                                {{ $diff = Carbon\Carbon::parse($exam->start_time)->diffForHumans(Carbon\Carbon::now()->addHours(1)) }}
                                            </div>
                                        </span>
                                    @endif
                                    @elseif (new \Carbon\Carbon(date("y:m:d")) > new \Carbon\Carbon($exam->date_exam))
                                        <div class="month-content-card-action">
                                            <a href="{{ route("exam_results",["teacher_id"=>$data["teacher_id"]
                                                ,"month_id"=>$data["month"]->id,"id"=>$exam->id]) }}" class="btn-transparent">
                                                عرض الإجابات
                                            </a>
                                        </div>
                                    @else
                                        <span class="table-danger d-block cursor">الامتحان لم يبدا بعد</span>
                                    @endif
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
