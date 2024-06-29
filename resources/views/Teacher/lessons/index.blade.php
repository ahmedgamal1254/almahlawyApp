@extends("Teacher.layouts.main")

@section("title-header")
<p>الفيديوهات</p>
@endsection

@section("content")
<div class="app-content content">
    <div class="container">
        <div class="row">
            <table class="table table-de mb-0 table-striped table-hover">
                <thead>
                    <tr>
                        <th>عنوان الدرس</th>
                        <th>رابط الدرس</th>
                        <th>اسم الوحدة</th>
                        <th>المرحلة الدراسية</th>
                        <th>التعديلات</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($lessons as $lesson)
                    <tr>
                        <td>{{ $lesson->title }}</td>
                        <td>
                            @if ($lesson->video_url and $lesson->img_caption)
                                <a href="{{ route("lesson.show",['id'=>$lesson->id]) }}" >
                                    <img class="img-thumbnail" style="width: 150px;height:150px;" src="{{ asset("public/app/".$lesson->img_caption) }}" alt=""></a>
                            @endif
                        </td>
                        <td>{{ $lesson->unit_name }}</td>
                        <td>{{ $lesson->school_grade }}</td>
                        <td>
                            <x-operation
                                :edit="route('lesson.edit',['id'=>$lesson->id])"
                                :view="route('lesson.show',['id'=>$lesson->id])"
                                :delete="route('lesson.destroy',['id'=>$lesson->id])"
                                :id="$lesson->id"
                                >
                            </x-operation>
                            @if($lesson->source == "main_server")
                                <a href="{{ route("files.index",["id"=>$lesson->id]) }}" class="btn btn-primary"><i class="fa fa-video"></i></a>
                            @endif
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="5" class="text-center">
                            <div class="alert alert-danger">
                                <span class="message_not_found">لا توجد دروس بعد</span>
                            </div>
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>

            <div class="row">
                <a href="{{ route("lesson.add") }}" class="btn btn-primary"><i class="fa fa-plus"></i> اضافة درس جديد</a>
            </div>
        </div>
        {{ $lessons->links() }}
    </div>
</div>
@endsection

