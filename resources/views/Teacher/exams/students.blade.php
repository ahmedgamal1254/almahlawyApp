@extends("Teacher.layouts.main")

@section("title-header")
<p>
    الاختبارات الالكترونية
</p>
@endsection

@section("content")
<div class="app-content content">
    <div class="container">
        {{-- <div class="table-header">الاختبارات الالكترونية</div> --}}
        <div class="row">
            <table class="table table-de mb-0 table-striped table-hover">
                <thead>
                    <tr>
                        <th>اسم الطالب</th>
                        <th>عدد الاسئلة المحلولة</th>
                        <th>الدرجة</th>
                        <th>الدرجة الكلية</th>
                        <th>مشاهدة الامتحان</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($students as $item)
                    <tr>
                        <td>{{ $item->name }}</td>
                        <td>{{ $item->question_exam_students_count }}</td>

                        <td>{{ $item->degree }}</td>
                        <td>
                           {{ $item->total }}
                        </td>
                        <td>
                            <a href="{{ route('students.show_exam',['exam_id'=>$item->exam_id,"user_id" => $item->id]) }}">
                                <i class="fa fa-eye"></i>
                            </a>
                        </td>
                    </tr>
                    @empty

                    <tr>
                        <td colspan="5" class="text-center">
                            <div class="alert alert-danger">
                                <span class="message_not_found">لا يوجد طلاب بعد</span>
                            </div>
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>

            <div class="row">
                <a href="{{ route("exams") }}" class="btn btn-primary"><i class="fa fa-plus"></i>جميع الامتحانات</a>
            </div>
        </div>
        {{ $students->links() }}
    </div>
</div>
@endsection
