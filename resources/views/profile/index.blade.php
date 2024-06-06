@extends("layouts_teacher_view.main-profile")

@section("title")
الملف الشخصى
@endsection

@section("content")
<div class="home-page">
    <div class="container">
        <div class="main">
            <div class="row">
                <div class="col-md-9">
                    <div class="card">
                        <div class="card-title">
                            <h4 style="text-align: right;"> الملف الشخصى :- {{ Auth::user()->name }}</h4>
                        </div>
                        <div class="card-body">
                            <i class="fa fa-pen fa-xs edit"></i>
                            <table class="table table-striped">
                                <tbody>
                                    <tr>
                                        <td>الاسم</td>
                                        <td>:</td>
                                        <td>{{ Auth::user()->name }}</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span>البروفايل</span>
                                        </td>
                                        <td>:</td>
                                        <td>
                                            @if (Auth::guard('web')->user()->profile)
                                                <img src="{{ asset("public/app/". Auth::guard('web')->user()->profile) }}" alt="" style="width:250px;height:250px;" class="img-fluid rounded img-thumbnail">
                                            @else
                                                <img src="{{ asset("assets/landing_assets/imgs/img/people.png") }}" alt="" class="img-fluid rounded img-thumbnail">
                                            @endif
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>البريد الالكترونى</td>
                                        <td>:</td>
                                        <td>{{ Auth::user()->email }}</td>
                                    </tr>
                                    <tr>
                                        <td>رقم الهاتف</td>
                                        <td>:</td>
                                        <td>{{ Auth::user()->phonenumber }}</td>
                                    </tr>
                                    <tr>
                                        <td>المحافظة</td>
                                        <td>:</td>
                                        <td>{{ $student->government }}</td>
                                    </tr>
                                    <tr>
                                        <td>الصف الدراسيى</td>
                                        <td>:</td>
                                        <td>{{ $student->school_grade }}</td>
                                    </tr>
                                    <tr>
                                        <td>المجموعة</td>
                                        <td>:</td>
                                        <td>{{ $student->subject_name }}</td>
                                    </tr>
                                    <tr>
                                        <td>الرصيد الحالى</td>
                                        <td>:</td>
                                        <td>{{ $student->active_points }}</td>
                                    </tr>
                                    <tr>
                                        <td>الرصيد الكلى</td>
                                        <td>:</td>
                                        <td>{{ $student->all_points }}</td>
                                    </tr>
                                    <tr>
                                        <td>مجموع النقاط</td>
                                        <td>:</td>
                                        <td>{{ $student->points }}</td>
                                    </tr>

                                    <tr>
                                        <td>تم التسجيل</td>
                                        <td>:</td>
                                        <td>{{ $diff = Carbon\Carbon::parse($student->created_at)->diffForHumans(Carbon\Carbon::now()) }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card" style="padding: 25px;">
                        <p>امتحانات اللتى تم تأديتها</p>
                        <div class="row">
                            @forelse ($exams as $exam)
                                <div class="col-6" style="margin-top: 20px;">
                                    <button type="button" style="margin-right: 5px;" class="btn btn-secondary" data-toggle="tooltip" data-placement="top"
                                        title="{{ round($exam->degree/$exam->total,2)*100 }}%">
                                            {{$exam->code}}
                                        </button>
                                </div>
                            @empty
                                <div class="alert alert-primary m-auto">لا توجد امتحانات بعد</div>
                            @endforelse
                        </div>
                         <!--<a class="btn btn-primary" href="{{ route("profile.edit",["id"=>$teacher->id]) }}">تعديل البيانات الاساسية</a>-->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
