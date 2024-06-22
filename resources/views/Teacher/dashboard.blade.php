@extends("Teacher.layouts.main")

@section("title-header")
<p>الرئيسية</p>
@endsection

@section("content")

<div class="app-content content">
    <div class="content-wrapper container-xxl">
        <div class="content-body">
            <div id="statistics-card" class="home-statistics-card">
                <div id="crypto-stats-3" class="row">
                    <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6">
                        <div class="card text-center">
                            <a href="{{ route("school_grade") }}">
                                <div class="card-body">
                                    <div class="avatar bg-light-info p-50 mb-1">
                                        <div class="avatar-content">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-layout"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><line x1="3" y1="9" x2="21" y2="9"></line><line x1="9" y1="21" x2="9" y2="9"></line></svg>
                                        </div>
                                    </div>
                                    <h2 class="font-weight-bolder">
                                        {{ \App\Models\SchoolGrade::count() }}
                                    </h2>
                                    <p class="card-text">الصفوف</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6">
                        <div class="card text-center">
                            <a href="{{ route("class") }}">
                                <div class="card-body">
                                    <div class="avatar bg-light-info p-50 mb-1">
                                        <div class="avatar-content">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                                        </div>
                                    </div>
                                    <h2 class="font-weight-bolder">
                                        {{ \App\Models\ClassStudy::count() }}
                                    </h2>
                                    <p class="card-text">المجموعات</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6">
                        <div class="card text-center">
                            <a href="{{ route("show_months") }}">
                                <div class="card-body">
                                    <div class="avatar bg-light-info p-50 mb-1">
                                        <div class="avatar-content">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-credit-card"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect><line x1="1" y1="10" x2="23" y2="10"></line></svg>
                                        </div>
                                    </div>
                                    <h2 class="font-weight-bolder">
                                        {{ \App\Models\Month::where("status",0)->count() }}
                                        </h2>
                                    <p class="card-text">الشهور المتاحة</p>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6">
                        <div class="card text-center">
                            <a href="{{ route("students") }}">
                                <div class="card-body">
                                    <div class="avatar bg-light-info p-50 mb-1">
                                        <div class="avatar-content">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                                        </div>
                                    </div>
                                    <h2 class="font-weight-bolder">{{ \App\Models\User::count() }}</h2>
                                    <p class="card-text">الطلاب</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6">
                        <div class="card text-center">
                            <a href="{{ route("units") }}">
                                <div class="card-body">
                                    <div class="avatar bg-light-info p-50 mb-1">
                                        <div class="avatar-content">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-book"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                                        </div>
                                    </div>
                                    <h2 class="font-weight-bolder">
                                        {{ \App\Models\Unit::count() }}
                                        </h2>
                                    <p class="card-text">أبواب (فصول)</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6">
                        <div class="card text-center">
                            <a href="{{ route("lessons") }}">
                                <div class="card-body">
                                    <div class="avatar bg-light-info p-50 mb-1">
                                        <div class="avatar-content">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-video"><polygon points="23 7 16 12 23 17 23 7"></polygon><rect x="1" y="5" width="15" height="14" rx="2" ry="2"></rect></svg>
                                        </div>
                                    </div>
                                    <h2 class="font-weight-bolder">
                                        {{ \App\Models\Lesson::count() }}
                                    </h2>
                                    <p class="card-text">الفيديوهات</p>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6">
                        <div class="card text-center">
                            <a href="{{ route("free-lessons") }}">
                                <div class="card-body">
                                    <div class="avatar bg-light-info p-50 mb-1">
                                        <div class="avatar-content">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-video"><polygon points="23 7 16 12 23 17 23 7"></polygon><rect x="1" y="5" width="15" height="14" rx="2" ry="2"></rect></svg>
                                        </div>
                                    </div>
                                    <h2 class="font-weight-bolder">
                                        {{ \App\Models\FreeVideos::count() }}
                                    </h2>
                                    <p class="card-text">الفيديوهات المجانية</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6">
                        <div class="card text-center">
                            <a href="{{ route("books") }}">
                                <div class="card-body">
                                    <div class="avatar bg-light-info p-50 mb-1">
                                        <div class="avatar-content">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-credit-card"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect><line x1="1" y1="10" x2="23" y2="10"></line></svg>
                                        </div>
                                    </div>
                                    <h2 class="font-weight-bolder">
                                        {{ \App\Models\Media::count() }}
                                        </h2>
                                    <p class="card-text">كتب الكترونية</p>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6">
                        <div class="card text-center">
                            <a href="{{ route("free-books") }}">
                                <div class="card-body">
                                    <div class="avatar bg-light-info p-50 mb-1">
                                        <div class="avatar-content">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-credit-card"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect><line x1="1" y1="10" x2="23" y2="10"></line></svg>
                                        </div>
                                    </div>
                                    <h2 class="font-weight-bolder">
                                        {{ \App\Models\FreeBooks::count() }}
                                        </h2>
                                    <p class="card-text">الكتب المجانية</p>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6">
                        <div class="card text-center">
                            <a href="{{ route("exams") }}">
                                <div class="card-body">
                                    <div class="avatar bg-light-info p-50 mb-1">
                                        <div class="avatar-content">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-credit-card"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect><line x1="1" y1="10" x2="23" y2="10"></line></svg>
                                        </div>
                                    </div>
                                    <h2 class="font-weight-bolder">
                                        {{ \App\Models\Exam::count() }}
                                        </h2>
                                    <p class="card-text">الاختبارات الالكترونية</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6">
                        <div class="card text-center">
                            <a href="{{ route("teacher.paper-exams") }}">
                                <div class="card-body">
                                    <div class="avatar bg-light-info p-50 mb-1">
                                        <div class="avatar-content">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-credit-card"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect><line x1="1" y1="10" x2="23" y2="10"></line></svg>
                                        </div>
                                    </div>
                                    <h2 class="font-weight-bolder">
                                        {{ \App\Models\StaticExam::count() }}
                                        </h2>
                                    <p class="card-text">الاختبارات الورقية</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6">
                        <div class="card text-center">
                            <a href="{{ route("questions") }}">
                                <div class="card-body">
                                    <div class="avatar bg-light-info p-50 mb-1">
                                        <div class="avatar-content">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-credit-card"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect><line x1="1" y1="10" x2="23" y2="10"></line></svg>
                                        </div>
                                    </div>
                                    <h2 class="font-weight-bolder">
                                        {{ \App\Models\Question::count() }}
                                        </h2>
                                    <p class="card-text">الاسئلة</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6">
                        <div class="card text-center">
                            <a href="{{ route("posts") }}">
                                <div class="card-body">
                                    <div class="avatar bg-light-info p-50 mb-1">
                                        <div class="avatar-content">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-credit-card"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect><line x1="1" y1="10" x2="23" y2="10"></line></svg>
                                        </div>
                                    </div>
                                    <h2 class="font-weight-bolder">
                                        {{ \App\Models\Post::count() }}
                                        </h2>
                                    <p class="card-text">المنشورات</p>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6">
                        <div class="card text-center">
                            <a href="{{ route("all_payments") }}">
                                <div class="card-body">
                                    <div class="avatar bg-light-info p-50 mb-1">
                                        <div class="avatar-content">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-credit-card"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect><line x1="1" y1="10" x2="23" y2="10"></line></svg>
                                        </div>
                                    </div>
                                    <h2 class="font-weight-bolder">
                                        {{ \App\Models\Payment::whereNull("status")->count() }}
                                        </h2>
                                    <p class="card-text">طلبات اضافة الرصيد</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-2">
                <!-- Donut Chart Starts -->
                <div class="col-lg-6 col-12">
                  <div class="card">
                    <div class="card-header">
                      <h4 class="card-title">الطلاب</h4>
                    </div>
                    <div class="card-body">
                        <canvas class="chartjs" id="students" data-height="250"></canvas>
                        @foreach ($school_grades as $school_grade)
                            <div class="d-flex justify-content-between">
                                <div class="d-flex align-items-center">
                                <i data-feather="tablet" class="font-medium-2 text-success"></i>
                                <span class="font-weight-bold ml-75 mr-25">{{ $school_grade->name }}</span>
                                <span>- {{ round(($school_grade->users_count/$users)*100,2) }}%</span>
                                </div>
                                {{-- <div>
                                    <span>-5%</span>
                                    <i data-feather="arrow-down" class="text-danger"></i>
                                </div> --}}
                            </div>
                        @endforeach
                    </div>
                  </div>
                </div>
                <!-- Donut Chart Starts -->

                <!--Bar Chart Start -->
                <div class="col-xl-6 col-12">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-sm-center align-items-start flex-sm-row flex-column">
                            <div class="header-left">
                                <h4 class="card-title">الطلاب حسب المحافظات</h4>
                            </div>
                        </div>
                        <div class="card-body">
                            <canvas id="governments" class="chartjs" data-height="400"></canvas>
                        </div>
                    </div>
                </div>
                <!-- Bar Chart End -->
            </div>
        </div>
    </div>
</div>
@endsection

@section("script")
    <script>
        let app="{{ route("teacher.stat") }}"
        let users="{{ $users }}"

        var primaryColorShade = '#836AF9',
            yellowColor = '#ffe800',
            successColorShade = '#28dac6',
            warningColorShade = '#ffe802',
            warningLightColor = '#FDAC34',
            infoColorShade = '#299AFF',
            greyColor = '#4F5D70',
            blueColor = '#2c9aff',
            blueLightColor = '#84D0FF',
            greyLightColor = '#EDF1F4',
            tooltipShadow = 'rgba(0, 0, 0, 0.25)',
            lineChartPrimary = '#666ee8',
            lineChartDanger = '#ff4961',
            labelColor = '#6e6b7b',
            grid_line_color = 'rgba(200, 200, 200, 0.2)'; // RGBA color helps in dark layout

        $.ajax({
            url:  app,
            type: 'get',
            success: function(data) {
                let d=data

                labels=[]
                numbers=[],
                colors=[]
                data.school_grades.forEach(element => {
                    labels.push(element.name)
                    numbers.push(Math.round((parseInt(element.users_count)/parseInt(users))*100,2))
                    colors.push(`rgba(19,${Math.round(Math.random()*100)},${Math.round(Math.random()*100)},1)`)
                });

                doughnutChartEx = $('#students')

                if (doughnutChartEx.length) {
                    var doughnutExample = new Chart(doughnutChartEx, {
                    type: 'doughnut',
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        responsiveAnimationDuration: 500,
                        cutoutPercentage: 60,
                        legend: { display: true },
                        tooltips: {
                        callbacks: {
                            label: function (tooltipItem, data) {
                            var label = data.datasets[0].labels[tooltipItem.index] || '',
                                value = data.datasets[0].data[tooltipItem.index];
                            var output = ' ' + label + ' : ' + value + ' %';
                            return output;
                            }
                        },
                        shadowOffsetX: 1,
                        shadowOffsetY: 1,
                        shadowBlur: 8
                        }
                    },
                    data: {
                        datasets: [
                            {
                                labels:labels,
                                data: numbers,
                                fill: true,
                                backgroundColor: colors,
                                borderWidth: 0,
                                pointStyle: 'rectRounded'
                            }
                        ]
                    }
                    });
                }

                // bar chart
                labels_barchart=[]
                values=[]

                let  barChartEx = $('#governments')

                const maxValueOfY = Math.max(...d.governments.map(o => o.total), 0);

                console.log(d.governments)

                d.governments.forEach(ele => {
                    labels_barchart.push(ele.government)
                    values.push(ele.total)
                })

                // Bar Chart
                // --------------------------------------------------------------------
                if (barChartEx.length) {
                    var barChartExample = new Chart(barChartEx, {
                    type: 'bar',
                    options: {
                        elements: {
                        rectangle: {
                            borderWidth: 2,
                            borderSkipped: 'bottom'
                        }
                        },
                        responsive: true,
                        maintainAspectRatio: false,
                        responsiveAnimationDuration: 500,
                        legend: {
                        display: false
                        },
                        tooltips: {
                        // Updated default tooltip UI
                        shadowOffsetX: 1,
                        shadowOffsetY: 1,
                        shadowBlur: 8,
                        // shadowColor: tooltipShadow,
                        // backgroundColor: window.colors.solid.white,
                        // titleFontColor: window.colors.solid.black,
                        // bodyFontColor: window.colors.solid.black
                        },
                        scales: {
                        xAxes: [
                            {
                            display: true,
                            gridLines: {
                                display: true,
                                // color: grid_line_color,
                                // zeroLineColor: grid_line_color
                            },
                            scaleLabel: {
                                display: false
                            },
                            ticks: {
                                // fontColor: labelColor
                            }
                            }
                        ],
                        yAxes: [
                            {
                            display: true,
                            gridLines: {
                                // color: grid_line_color,
                                // zeroLineColor: grid_line_color
                            },
                            ticks: {
                                stepSize: 100,
                                min: 0,
                                max: maxValueOfY,
                                fontColor: "4BB543"
                            }
                            }
                        ]
                        }
                    },
                    data: {
                        labels: labels_barchart,
                        datasets: [
                        {
                            barThickness: 15,
                            data: values,
                            backgroundColor: "#4BB543",
                            borderColor: 'transparent'
                        }
                        ]
                    }
                    });
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // Handle any errors
                console.log('Error:', textStatus, errorThrown);
            }
        });


    </script>
@endsection
