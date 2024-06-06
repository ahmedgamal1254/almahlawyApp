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
                        <th>اسم المادة</th>
                        <th>وصف المادة</th>
                        <th>المرحلة الدراسية</th>
                        <th>التعديلات</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($subjects as $subject)
                    <tr>
                        <td>{{ $subject->title }}</td>
                        <td>{{ $subject->description }}</td>
                        <td>{{ $subject->name }}</td>
                        <td>
                            <x-operation
                                :edit="route('subject.edit',['id'=>$subject->id])"
                                :view="route('subject.show',['id'=>$subject->id])"
                                :delete="route('subject.destroy',['id'=>$subject->id])"
                                :id="$subject->id"
                                >
                            </x-operation>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="5" class="text-center">
                            <div class="alert alert-danger">
                                <span class="message_not_found">لا توجد مواد دراسية بعد</span>
                            </div>
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>

            <div class="row">
                <a href="{{ route("subject.add") }}" class="btn btn-primary"><i class="fa fa-plus"></i> اضافة مادة دراسية جديدة</a>
            </div>
        </div>
    </div>
</div>
@endsection
