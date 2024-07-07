@extends("Teacher.layouts.main")

@section("title-header")
<p>عنزان السؤال {{ $question->name }}</p>
@endsection

@section("content")
<div class="app-content content">
    <div class="container">
        {{-- <div class="table-header">
            <div class="table-name">
                عنزان السؤال {{ $question->name }}
            </div>
        </div> --}}

        <div class="card" style="width: 100%">
            <div class="card-body">
                <h5 class="card-title">عنوان السؤال :- {{ $question->name }}</h5>
                <p class="card-text">وصف السؤال :- {{ $question->description }}</p>
                <p class="card-text">اسم المرحلة الدراسية :- {{ $question->school_grade }}</p>
                <p class="card-text">اسم الوحدة الدراسية :- {{ $question->unit_name }}</p>
                @if ($question->name)
                    <h5 class="card-title">عنوان السؤال :- {{ $question->name }}</h5>
                @endif

                @if ($question->img)
                    <img src="{{ asset("app/" . $question->img) }}" alt="">
                @endif
                <p class="card-text">اجابات السؤال</p>
                @if (is_array(json_decode($question->chooses, true)))
                    @forelse (json_decode($question->chooses, true) as $item)
                        <div class="form-control">
                        <input type="radio" name="chooses" id="{{ $item }}">
                        <label for="{{ $item }}">{{ $item }}</label>
                        </div>
                    @empty

                    @endforelse
                @endif
                <br>
                <div class="row">
                    <span>الاجابة الصحيحة</span>
                    <div class="form-control">
                        <input type="radio" name="answer" disabled id="{{ $question->answer }}">
                        <label for="{{ $question->answer }}" >{{ $question->answer }}</label>
                    </div>
                </div>
                <br>
                <x-operation
                :edit="route('question.edit',['id'=>$question->id])"
                :delete="route('question.destroy',['id'=>$question->id])"
                >
                </x-operation>
            </div>
        </div>

        <a href="{{ route("questions") }}" class="btn btn-primary">Show All <i class="fa fa-eye"></i></a>
    </div>
</div>
@endsection
