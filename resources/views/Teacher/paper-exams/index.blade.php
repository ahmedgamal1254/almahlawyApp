@extends("Teacher.layouts.main")

@section("title-header")
<p>المواد الدراسية</p>
@endsection

@section("content")
<div class="app-content content">
    <div class="container">
        <div class="row">
            <table class="table table-de mb-0 table-striped table-hover">
                <thead>
                    <tr>
                        <th>الامتحان</th>
                        <th>الطالب</th>
                        <th>درجة الطالب</th>
                        <th>الدرجة الكلية</th>
                        <th>المرحلة الدراسية</th>
                        <th>التعديلات</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($exams as $exam)
                    <tr>
                        <td>{{ $exam->title }}</td>
                        <td>{{ $exam->user->name }}</td>
                        <td>{{ $exam->student_degree }}</td>
                        <td>{{ $exam->total_degree }}</td>
                        <td>{{ $exam->school_grade->name }}</td>
                        <td>
                            <x-operation
                                :edit="route('teacher.paper-exams.edit',['id'=>$exam->id])"
                                :delete="route('teacher.paper-exams.destroy',['id'=>$exam->id])"
                                :id="$exam->id">
                            </x-operation>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="5" class="text-center">
                            <div class="alert alert-danger">
                                <span class="message_not_found">لا توجد امتحانات بعد</span>
                            </div>
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>

            <div class="row">
                <a href="{{ route("teacher.paper-exams.create") }}" class="btn btn-primary"><i class="fa fa-plus"></i> اضافة امتحان جديدة</a>
            </div>
        </div>
    </div>
</div>
@endsection
