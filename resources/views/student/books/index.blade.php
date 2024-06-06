@extends("student.layouts.master")

@section("content")
<div class="home-page">
    <div class="container">

        <div class="month-container">
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
                            @foreach ($data["books"] as $book)
                               <div class="month-content-card">
                                <div class="month-content-card-title">
                                    <!-- <figure style="background-image: url()"></figure> -->
                                    <div class="card-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-book"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                                    </div>
                                    <div class="month-content-card-info">
                                        <div class="upper-info">
                                            <span>كتاب إلكترنى {{ $book->title }}</span>
                                        </div>
                                        <h3>{{ $book->description }}</h3>
                                    </div>
                                </div>

                                <div class="month-content-card-action">
                                    <div class="btn-transparent _df_button" source="{{ asset("public/app".$book->media_url) }}">فتح الكتاب</div>
                                </div>
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
