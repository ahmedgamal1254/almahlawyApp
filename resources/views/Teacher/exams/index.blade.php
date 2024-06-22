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
                        <th>اسم الامتحان</th>
                        <th>عدد الاسئلة</th>
                        <th>ميعاد الامتحان</th>
                        <th>مدة الامتحان</th>
                        <th>المرحلة الدراسية</th>
                        <th>التعديلات</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($exams as $item)
                    <tr>
                        <td>{{ $item->title }}</td>
                        <td>{{ $item->questions_count }}</td>

                        <td>{{ $item->date_exam }}</td>
                        <td>
                           {{ $item->duration }}
                        </td>
                        <td>{{ $item->stage->name }}</td>
                        <td>
                            <x-operation
                                :edit="route('exam.edit',['id'=>$item->id])"
                                :view="route('exam.show',['id'=>$item->id])"
                                :delete="route('exam.destroy',['id'=>$item->id])"
                                :id="$item->id"
                                >
                            </x-operation>
                            <a href="{{ route("exam.print",["id" => $item->id]) }}" class="btn btn-info"><i class="fa fa-file"></i></a>
                            <a href="{{ route("exam.students",["id" => $item->id]) }}" class="btn btn-info"><i class="fa fa-users"></i></a>
                        </td>
                    </tr>
                    @empty

                    <tr>
                        <td colspan="5" class="text-center">
                            <div class="alert alert-danger">
                                <span class="message_not_found">لا توجد امتحانات دراسية بعد</span>
                            </div>
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>

            <div class="row">
                <a href="{{ route("exam.add") }}" class="btn btn-primary"><i class="fa fa-plus"></i> اضافة امتحان جديد</a>
            </div>
        </div>
        {{ $exams->links() }}
    </div>
</div>
@endsection
