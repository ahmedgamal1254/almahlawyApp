@extends("student.layouts.master")

@section("title")
المنشورات
@endsection

@section("content")
<div class="home-page">
    <div class="container">
        <div class="month-container">
            <div class="row">
                @forelse ($data["posts"] as $post)
                <div class="col-lg-4 col-sm-12">
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" src="{{ asset("public/app/".$post->image_url) }}" alt="Card image cap">
                        <div class="card-body">
                        <h5 class="card-title">{{ $post->title }}</h5>
                        <p class="card-text">{{ $post->description }}</p>
                        <a href="{{ route("posts_student_teacher.id",["teacher_id"=>$data["teacher_id"]
                        ,"month_id"=>$data["month_id"],"id"=>$post->id]) }}" class="card-link">مشاهدة البوست</a>
                        </div>
                    </div>
                </div>
                @empty
                    <div class="alert alert-danger block">لا توجد منشورات بعد</div>
                @endforelse
            </div>
        </div>
    </div>
</div>
@endsection
