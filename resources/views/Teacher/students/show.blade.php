@extends("Teacher.layouts.main")

@section("title-header")
<p>الملف الشخصى :- {{ $student->name }}</p>
@endsection

@section("content")
<div class="app-content content">
<!-- Main -->
<div class="main" style="width: 100%;margin-left:2%;margin-bottom:100px;">
    {{-- <h2 style="text-align: right;"> الملف الشخصى :- {{ $student->name }} </h2> --}}
    <div class="card">
        <div class="card-body">
            <i class="fa fa-pen fa-xs edit"></i>
            <table>
                <tbody>
                    <tr>
                        <td>الاسم</td>
                        <td>:</td>
                        <td>{{ $student->name }}</td>
                    </tr>
                    <tr>
                        <td>
                            <span>البروفايل</span>
                        </td>
                        <td>:</td>
                        <td>
                            @if ($student->profile)
                                <img src="{{ asset("public/app/". $student->profile) }}" alt="" class="img-fluid rounded img-thumbnail">
                            @else
                                <img src="{{ asset("assets/imgs/img/people.png") }}" alt="" class="img-fluid rounded img-thumbnail">
                            @endif
                        </td>
                    </tr>
                    <tr>
                        <td>البريد الالكترونى</td>
                        <td>:</td>
                        <td>{{ $student->email }}</td>
                    </tr>
                    <tr>
                        <td>رقم الهاتف</td>
                        <td>:</td>
                        <td>{{ $student->phonenumber }}</td>
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
                        <td>الرصيد المتاح</td>
                        <td>:</td>
                        <td>{{ $student->active_points }}</td>
                    </tr>
                    <tr>
                        <td>الرصيد الكلى</td>
                        <td>:</td>
                        <td>{{ $student->all_points }}</td>
                    </tr>
                    <tr>
                        <td>تم الاضافة</td>
                        <td>:</td>
                        <td>{{ $diff = Carbon\Carbon::parse($student->created_at)->diffForHumans(Carbon\Carbon::now()) }}</td>
                    </tr>
                    <tr>
                        <td>
                            تحديث الرصيد
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <form action="" method="post" class="points">
                                @csrf
                                <input type="hidden" name="user_id" value="{{ $student->id }}">
                                <div class="d-flex flex-column justify-content-start align-items-start">
                                    <div class="col-lg-9">
                                        <div class="mb-3">
                                            <input type="number" name="point" class="form-control" id="number" placeholder="تعديل نقاط الطالب">
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <button type="submit" class="btn btn-success">
                                            حفظ
                                        </button>
                                    </div>
                                </div>
                                <div id="qloader" class="loader"></div>
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="card">

        <div class="row">
            <a href="{{ route("students.show_exams",$student->id) }}" class="btn btn-primary">
                <i class="fa fa-eye"></i>
                جميع الامتحانات
            </a>
            <table class="table table-de mb-0 table-striped table-hover">
                <thead>
                    <tr>
                        <td>الامتحان</td>
                        <td>تاريخ اجراء الامتحان</td>
                        <td>الدرجة</td>
                        <td>الدرجة الكلية</td>
                        <td>عدد الاسئلة الكلية</td>
                        <td>عدد الاسئلة المحلولة</td>
                        <td>عمليات</td>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($exams as $exam)
                        <tr>
                            <td>{{ $exam->title }}</td>
                            <td>
                                {{ \Carbon\Carbon::parse($exam->created_at)->format("D d F Y") }}
                            </td>
                            <td>
                                {{ $exam->degree }}
                            </td>
                            <td>
                                {{ $exam->total }}
                            </td>
                            <td>
                                {{ $exam->question_exams_count }}
                            </td>
                            <td>
                                {{ $exam->question_exam_students_count }}
                            </td>
                            <td>
                                <a href="{{ route("students.show_exam",["user_id" => $student->id,"exam_id" => $exam->id]) }}" class="btn btn-success">
                                    <i class="fa fa-eye"></i>
                                </a>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="7">
                                <span class="text-center">لم يتم اجراء امتحانات بعد</span>
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>


    <div class="card">
        <div class="">
            <div class="row">
                <table class="table table-de mb-0 table-striped table-hover">
                    <thead>
                        <tr>
                            <td>الشهر</td>
                            <td>القيمة</td>
                            <td>تاريخ الشراء</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($months as $month)
                            <tr>
                                <td>{{ $month->month_description }} - {{ $month->month_date }}</td>
                                <td>
                                    {{ $month->cost }}
                                </td>
                                <td>
                                    {{ \Carbon\Carbon::parse($month->pivot->created_at)->format("D d F Y") }}
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="8">
                                    <span class="text-center">لم يتم شراء شهور بعد</span>
                                </td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- End -->
</div>
@endsection

@section("script")
    <script>
        let url="{{ env("APP_URL") }}"
    </script>
    <script src="{{ asset("assets/landing_assets/js/ajax_student.js") }}"></script>
@endsection
