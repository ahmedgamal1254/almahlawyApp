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
                @if ($lesson->source == "main_server")
                    <video src="{{ asset($lesson->video_url) }}"
                        style="width:500px;height:500px;"
                        controls poster="{{ asset($lesson->image_caption) }}">
                    </video>
                @elseif ($lesson->source=="youtube")
                    <div id="video-container"></div>
                @endif
              </div>
              <x-operation
                :edit="route('free-lesson.edit',['id'=>$lesson->id])"
                :delete="route('free-lesson.destroy',['id'=>$lesson->id])"
                >
                </x-operation>
            </div>
        </div>

        <a href="{{ route("free-lessons") }}" class="btn btn-primary">Show All <i class="fa fa-eye"></i></a>
    </div>
</div>
@endsection

@section("script")
<script>
    function getYouTubeId(url) {
      const regex = /(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})/;
      const match = url.match(regex);
      return match ? match[1] : null;
    }

    function embedYouTubeVideo(url) {
      const videoId = getYouTubeId(url);
      if (videoId) {
        const iframe = document.createElement('iframe');
        iframe.width = '560';
        iframe.height = '315';
        iframe.src = `https://www.youtube.com/embed/${videoId}?controls=1&modestbranding=1&rel=0`;
        iframe.frameborder = '0';
        iframe.allow = 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture';
        iframe.allowFullscreen = true;
        document.getElementById('video-container').appendChild(iframe);
      } else {
        console.error('Invalid YouTube URL');
      }
    }

    window.onload = function() {
      const url = "{{ $lesson->video_url }}";
      embedYouTubeVideo(url);
    }
</script>
@endsection
