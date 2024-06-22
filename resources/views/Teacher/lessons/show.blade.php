@extends("Teacher.layouts.main")

@section("title-header")
<p>
    الدرس {{ $lesson->title }}
</p>
@endsection

@section("content")
<div class="app-content content">
    <div class="container">
        {{-- <div class="table-header">الدرس {{ $lesson->title }}</div> --}}

        <div class="card" style="width: 100%">
            <div class="card-body">
              <h5 class="card-title">عنوان الدرس :- {{ $lesson->title }}</h5>
              <p class="card-text">وصف الدرس :- {{ $lesson->description }}</p>
              <p class="card-text">اسم المرحلة الدراسية :- {{ $lesson->school_grade }}</p>
              <p class="card-text">اسم الوحدة الدراسية :- {{ $lesson->unit_name }}</p>

              <div class="container">
                <video src="{{ asset("public/app/videos/".$lesson->video_url) }}"
                    style="width:500px;height:500px;"
                    controls poster="{{ asset("public/app/".$lesson->img_caption) }}"></video>
              </div>
              <x-operation
                :edit="route('lesson.edit',['id'=>$lesson->id])"
                :delete="route('lesson.destroy',['id'=>$lesson->id])"
                >
                </x-operation>
            </div>
        </div>

        <a href="{{ route("lessons") }}" class="btn btn-primary">Show All <i class="fa fa-eye"></i></a>
    </div>
</div>
@endsection
