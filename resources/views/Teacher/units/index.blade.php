@extends("Teacher.layouts.main")

@section("title-header")
<p>الوحدات الدراسية للمادة</p>
@endsection

@section("content")
<div class="app-content content">
    <div class="container">
        <div class="row">
            <table class="table table-de mb-0 table-striped table-hover">
                <thead>
                    <tr>
                        <th>اسم الوحدة</th>
                        <th>وصف الوحدة</th>
                        <th>المرحلة الدراسية</th>
                        <th>التعديلات</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($units as $unit)
                    <tr>
                        <td>{{ $unit->title }}</td>
                        <td>{{ $unit->description }}</td>
                        <td>{{ $unit->school_grade }}</td>
                        <td>
                            <x-operation
                                :edit="route('unit.edit',['id'=>$unit->id])"
                                :view="route('unit.show',['id'=>$unit->id])"
                                :delete="route('unit.destroy',['id'=>$unit->id])"
                                :id="$unit->id"
                                >
                            </x-operation>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="5" class="text-center">
                            <div class="alert alert-danger">
                                <span class="message_not_found">لا توجد وحدات دراسية بعد</span>
                            </div>
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>

            <div class="row">
                <a href="{{ route("unit.add") }}" class="btn btn-primary"><i class="fa fa-plus"></i> اضافة وحدة دراسية جديدة</a>
            </div>
        </div>
        {{ $units->links() }}
    </div>
</div>
@endsection
