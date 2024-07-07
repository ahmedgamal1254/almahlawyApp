@extends("Teacher.layouts.main")

@section("title-header")
<p>المنشورات</p>
@endsection

@section("content")
<div class="app-content content">
    <div class="container">
        {{-- <div class="table-header">المنشورات</div> --}}

        <div class="row">
            <table class="table table-de mb-0 table-striped table-hover">
                <thead>
                    <tr>
                        <th>عنوان المنشور</th>
                        <th>صورة المنشور</th>
                        <th>المرحلة الدراسية</th>
                        <th>التعديلات</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($posts as $post)
                    <tr>
                        <td>{{ $post->title }}</td>
                        <td>
                            @if ($post->image_url)
                            <img src="{{ asset("app/". $post->image_url) }}" width="100" height="100" alt="">
                            @else
                            <img src="" alt="">
                            @endif
                        </td>
                        <td>{{ $post->school_grade }}</td>
                        <td>
                            <x-operation
                                :edit="route('post.edit',['id'=>$post->id])"
                                :view="route('post.show',['id'=>$post->id])"
                                :delete="route('post.destroy',['id'=>$post->id])"
                                :id="$post->id"
                                >
                            </x-operation>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="5" class="text-center">
                            <div class="alert alert-danger">
                                <span class="message_not_found">لا توجد منشورات دراسية بعد</span>
                            </div>
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>


            <div class="row">
                <a href="{{ route("post.add") }}" class="btn btn-primary"><i class="fa fa-plus"></i> اضافة منشور جديد</a>
            </div>
        </div>

        {{ $posts->links() }}
    </div>
</div>
@endsection
