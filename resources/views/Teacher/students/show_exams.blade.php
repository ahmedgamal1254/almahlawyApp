@extends("Teacher.layouts.main")

@section("title-header")
<p> امتحانات الطالب :- {{ $student->name }}</p>
@endsection

@section("content")
<div class="app-content content">
<!-- Main -->
<div class="main" style="width: 100%;margin-left:2%;margin-bottom:100px;">

    <div class="card">
        <div class="row">
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

        {{ $exams->links() }}
    </div>
</div>
<!-- End -->
</div>
@endsection
