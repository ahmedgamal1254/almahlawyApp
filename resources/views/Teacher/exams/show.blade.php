@extends("Teacher.layouts.main")

@section("title-header")
<p>
    كود الامتحان  {{ $exam->code }}
</p>
@endsection

@section("content")
<div class="app-content content">
    <div class="container">
        {{-- <div class="table-header">كود الامتحان {{ $exam->code }}</div> --}}

        <a href="{{ route("exams") }}" class="btn btn-primary">Show All <i class="fa fa-eye"></i></a>

        <div class="card" style="width: 100%">
            <div class="card-body">
              <h5 class="card-title">عنوان الامتحان :- {{ $exam->title }}</h5>
              <h5 class="card-title">مدة الامتحان :- {{ $exam->duration }}</h5>
              <p class="card-text">ميعاد الامتحان :- {{ $exam->date_exam }}</p>
              <p>وصف الامتحان :- {{ $exam->description }}</p>
              <p class="card-text">اسم المرحلة الدراسية :- {{ $exam->school_grade }}</p>
              <p class="card-text">اسم المادة الدراسية :- {{ $exam->subject_name }}</p>
              <x-operation
                :edit="route('exam.edit',['id'=>$exam->id])"
                :delete="route('exam.destroy',['id'=>$exam->id])"
                >
                </x-operation>
            </div>
        </div>

        <div class="card" style="width: 100%">
            <div class="card-body">
                <h5 class="card-title">
                    أسئلة الامتحان
                </h5>
            </div>
        </div>
        @forelse ($questions as $question)
        <div class="row align-items-start" style="flex-direction: column;width:100%;">
            <div class="card" style="padding: 40px;font-size: 18px;width:100%;">
                <p class="card-text">{{ $question->name }}</p>
                @if ($question->img)
                    <img src="{{ asset("app/" . $question->img) }}" class="rounded" alt="">
                @endif
                <div class="form-group row align-items-start" style="flex-direction: column;padding:10px 0;width:100%!important;">
                    @if (!empty($question->chooses))
                        @foreach (json_decode($question->chooses,true) as $item)
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                                <label class="form-check-label" for="defaultCheck1">
                                    {{ $item }}
                                </label>
                            </div>
                        @endforeach
                    @endif
                </div>
            </div>
        </div>
        @empty
            <div class="alert alert-primary">لا توجد أسئلة مضافة لهذا الامتحان بعض</div>
        @endforelse
        </div>
        {{ $questions->links() }}
        <div class="card">
            <a href="{{ route("add_questions",["id"=>$exam->id]) }}" class="btn btn-primary" style="display: inline-block;">اضافة أسئلة ل الامتحان</a>
        </div>
    </div>
</div>
@endsection
