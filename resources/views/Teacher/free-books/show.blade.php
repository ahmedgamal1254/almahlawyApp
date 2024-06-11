@extends("Teacher.layouts.main")

@section("title-header")
<p>
    كتاب :- {{ $book->title }}
</p>
@endsection

@section("content")
<div class="app-content content">
    <div class="container">
        {{-- <div class="table-header">كتاب :- {{ $book->title }}</div> --}}

        <div class="card" style="width: 100%">
            <div class="card-body">
              <h5 class="card-title">عنوان الكتاب :- {{ $book->title }}</h5>
              <p class="card-text">وصف الكتاب :- {{ $book->description }}</p>
              <p class="card-text">اسم المرحلة الدراسية :- {{ $book->school_grade }}</p>
              <p class="card-text">اسم المادة الدراسية :- {{ $book->subject_name }}</p>

              <x-operation
                :edit="route('free-book.edit',['id'=>$book->id])"
                :delete="route('free-book.destroy',['id'=>$book->id])"
                >
                </x-operation>
            </div>
        </div>

        <div class="card">
            <a href="{{ $book->media_url }}" class="btn btn-primary">عرض الكتاب</a>
        </div>

        <a href="{{ route("free-books") }}" class="btn btn-primary">Show All <i class="fa fa-eye"></i></a>
    </div>
</div>
@endsection
