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
                        <th>الفصل الافتراضى</th>
                        <th>لينك الفصل الافتراضى</th>
                        <th>المرحلة الدراسية</th>
                        <th>الفصل (الشابتر)</th>
                        <th>التعديلات</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($vrsession as $item)
                    <tr>
                        <td>{{ $item->name }}</td>
                        <td>{{ $item->link }}</td>
                        <td>{{ $item->school_grade->name }}</td>
                        <td>{{ $item->unit->title }}</td>
                        <td>
                            <x-operation
                                :edit="route('teacher.sessions.edit',['id'=>$item->id])"
                                :delete="route('teacher.sessions.destroy',['id'=>$item->id])"
                                :id="$item->id"
                                >
                            </x-operation>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="5" class="text-center">
                            <div class="alert alert-danger">
                                <span class="message_not_found">لا توجد فصول دراسية بعد</span>
                            </div>
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>

            <div class="row">
                <a href="{{ route("teacher.sessions.create") }}" class="btn btn-primary"><i class="fa fa-plus"></i> اضافة حصة دراسية جديدة</a>
            </div>
        </div>
    </div>
</div>
@endsection
