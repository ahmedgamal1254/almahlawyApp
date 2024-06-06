@extends("student.layouts.master")

@section("title")
تحميل كتاب {{ $book->title }}
@endsection

@section("content")
<div class="home-page">
    <div class="container">
        <div>
            <div style="left: 0px; width: 100%; height: 0px; position: relative; padding-bottom: 141.4227%;">
                <iframe src="{{asset("public/app/books/".$book->media_url)}}"
                frameborder="0" allowfullscreen="true" webkitallowfullscreen="true"
                mozallowfullscreen="true"
                style="top: 0px; left: 0px; width: 100%; height: 100%; position: absolute;">
                </iframe>
            </div>
        </div>
    </div>
</div>
@endsection

@section("title_script")
{{-- <script
src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.0.943/pdf.min.js">
</script> --}}

@endsection

@section("script")

@endsection
