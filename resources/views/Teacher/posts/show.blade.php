@extends("Teacher.layouts.main")

@section("title-header")
<p>{{ str()->limit($post->title,100) }}</p>
@endsection

@section("content")
<div class="app-content content">
    <div class="container">
        {{-- <div class="table-header">المنشور {{ $post->title }}</div> --}}

        <div class="card" style="width: 100%">
            <div class="card-body">
              <h5 class="card-title">عنوان المنشور :- {{ $post->title }}</h5>
              <p class="card-text">اسم المرحلة الدراسية :- {{ $post->school_grade }}</p>
              <p class="card-text">اسم المادة الدراسية :- {{ $post->subject_name }}</p>
              <img src="{{ asset("public/app/". $post->image_url) }}" class="img-thumbnail img-container" alt="">

                <p class="card-text">وصف المنشور :- {!! $post->description !!}</p>
            </div>
        </div>

        <a href="{{ route("posts") }}" class="btn btn-primary">Show All <i class="fa fa-eye"></i></a>
    </div>
</div>
@endsection
