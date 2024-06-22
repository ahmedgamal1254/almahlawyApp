@extends("Teacher.layouts.main")

@section("title-header")
<p>
    الكتب الدراسية
</p>
@endsection

@section("content")
<div class="app-content content">
    <div class="container">
        {{-- <div class="table-header">الكتب الدراسية</div> --}}
        <div class="row">
            <table class="table table-de mb-0 table-striped table-hover">
                <thead>
                    <tr>
                        <th>اسم الكتاب</th>
                        <th>وصف الكتاب</th>
                        <th>رابط الكتاب</th>
                        <th>اسم الشابتر</th>
                        <th>المرحلة الدراسية</th>
                        <th>التعديلات</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($books as $item)
                    <tr>
                        <td>{{ $item->title }}</td>
                        <td>{{ $item->description }}</td>
                        <td>
                            <a href="{{ url("public/app/books/".$item->media_url) }}" frameborder="0">رابط الكتاب</a>
                        </td>
                        <td>{{ $item->subject_name ? $item->subject_name:"المنهج بالكامل" }}</td>
                        <td>{{ $item->school_grade }}</td>
                        <td>
                            <x-operation
                                :edit="route('free-book.edit',['id'=>$item->id])"
                                :view="route('free-book.show',['id'=>$item->id])"
                                :delete="route('free-book.destroy',['id'=>$item->id])"
                                :id="$item->id"
                                >
                            </x-operation>
                            <a href="{{ route("free-book.index",["id"=>$item->id]) }}" class="btn btn-primary"><i class="fa fa-book"></i></a>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="6" class="text-center">
                            <div class="alert alert-danger">
                                <span class="message_not_found">لا توجد كتب دراسية بعد</span>
                            </div>
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>

            <div class="row">
                <a href="{{ route("free-book.add") }}" class="btn btn-primary"><i class="fa fa-plus"></i> اضافة كتاب دراسى جديد</a>
            </div>
        </div>
        {{ $books->links() }}
    </div>
</div>
@endsection
