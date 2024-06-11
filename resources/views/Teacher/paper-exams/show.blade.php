@extends("Teacher.layouts.main")

@section("content")
<div class="app-content content">
    <div class="container">
        <div class="card" style="width: 100%">
            <table class="table table-striped">
                <tbody>
                    <tr>
                        <td>الفصل الدراسى</td>
                        <td>:</td>
                        <td>{{ $exam->school_grade ? $exam->school_grade->name:""  }}</td>
                    </tr>
                    <tr>
                        <td>اسم الطالب</td>
                        <td>:</td>
                        <td>
                            {{ $exam->user->name }}
                        </td>
                    </tr>
                    <tr>
                        <td>درجة الطالب</td>
                        <td>:</td>
                        <td>
                            {{ $exam->student_degree }}
                        </td>
                    </tr>
                    <tr>
                        <td>الدرجة الكلية</td>
                        <td>:</td>
                        <td>
                            {{ $exam->total_degree }}
                        </td>
                    </tr>
                    <tr>
                        <td>النسبة المئوية</td>
                        <td>:</td>
                        <td>
                            {{ round($exam->student_degree/$exam->total_degree,2)*100 }}
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        {{-- exam --}}
        <div class="container m-auto">
            <embed src="{{ asset("public/app/" . $exam->exam) }}" style="max-width:1024px;width:100%;height:80vh;">
        </div>

        <a href="{{ route("subject") }}" class="btn btn-primary">Show All <i class="fa fa-eye"></i></a>
    </div>
</div>
@endsection
