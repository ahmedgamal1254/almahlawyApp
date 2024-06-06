@extends("Teacher.layouts.main")

@section("title-header")
<p>الاسئلة الدراسية</p>
@endsection

@section("content")
<div class="app-content content">
    <div class="container">
        {{-- <div class="table-header">
            <div class="table-name">
            الاسئلة الدراسية
            </div>
        </div> --}}
        <div class="row">
            <table class="table table-de mb-0 table-striped table-hover">
                <thead>
                    <tr>
                        <th>عنوان السؤال</th>
                        <th>وصف السؤال</th>
                        <th>احتيارات السؤال</th>
                        <th>اسم الوحدة</th>
                        <th>المرحلة الدراسية</th>
                        <th>التعديلات</th>
                    </tr>
                </thead>
                <tbody id="search_part">
                    @forelse ($questions as $item)
                    <tr>
                        <td>{{ $item->name }}</td>
                        <td>{{ $item->description }}</td>
                        <td>
                            {{ $item->answer }}
                        </td>
                        <td>{{ $item->unit_name }}</td>
                        <td>{{ $item->school_grade }}</td>
                        <td>
                            <x-operation
                                :edit="route('question.edit',['id'=>$item->id])"
                                :view="route('question.show',['id'=>$item->id])"
                                >
                            </x-operation>
                        </td>
                    </tr>
                    @empty
                    <div class="alert alert-danger">لا توجد أسئلة دراسية بعد</div>
                    @endforelse
                </tbody>
            </table>

            <div class="row">
                <a href="{{ route("question.add") }}" class="btn btn-primary"><i class="fa fa-plus"></i> اضافة سؤال جديد</a>
            </div>
        </div>
        {{ $questions->links() }}
    </div>
</div>
@endsection
