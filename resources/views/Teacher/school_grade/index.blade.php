@extends("Teacher.layouts.main")

@section("title-header")
<p>المراحل الدراسية</p>
@endsection

@section("content")
<div class="app-content content">
    <div class="container">
        <div class="table-name">
            <div class="table-name">
                المراحل الدراسية
            </div>
        </div>
        <div class="row">
            <table class="table table-de mb-0 table-striped table-hover">
                <thead>
                    <tr>
                        <th>اسم المرحلة</th>
                        <th>الطلاب</th>
                        <th>الكتب</th>
                        <th>الفيديوهات</th>
                        <th>الامتحانات</th>
                        <th>التعديلات</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($school_grades as $school_grade)
                    <tr>
                        <td>{{ $school_grade->name }}</td>
                        <td>
                            <span>{{ count($school_grade->users) }}</span>
                            | <a href="{{ route("school_grade.students",["school_grade_id"=>$school_grade->id]) }}">
                                <i class="fa fa-eye"></i>
                            </a>
                        </td>
                        <td>
                            <span>{{ count($school_grade->books) }}</span>
                            | <a href="#">
                                <i class="fa fa-eye"></i>
                            </a>
                        </td>
                        <td>
                            <span>{{ count($school_grade->lessons) }}</span>
                            | <a href="#">
                                <i class="fa fa-eye"></i>
                            </a>
                        </td>
                        <td>
                            <span>{{ count($school_grade->exams) }}</span>
                            | <a href="#">
                                <i class="fa fa-eye"></i>
                            </a>
                        </td>
                        <td>
                            <x-operation
                                :edit="route('school_grade.edit',['id'=>$school_grade->id])"
                                :delete="route('school_grade.destroy',['id'=>$school_grade->id])"
                                :id="$school_grade->id"
                                >
                            </x-operation>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="7" class="text-center">
                            <div class="alert alert-danger">
                                <span class="message_not_found">
                                    لا توجد مراحل دراسية بعد
                                </span>
                            </div>
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>

            <div class="row">
                <a href="{{ route("school_grade.add") }}" class="btn btn-primary"><i class="fa fa-plus"></i> اضافة مرحلة دراسية جديدة</a>
            </div>
        </div>
        {{ $school_grades->links() }}
    </div>
</div>
@endsection
