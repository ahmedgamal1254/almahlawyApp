@extends("Teacher.layouts.main")

@section("title")
الامتحان {{$data["exam"]->title}}
@endsection

@section("content")
<div class="app-content content">
    <div class="container">
        <div class="exam">
            <div class="row">
                <div class="col-12">
                    <div class="exam-details">

                        <div class="exam-info">
                            <span class="tag">اختبار رقم {{$data["exam"]->code}}</span>
                            <h5>{{ $data["exam"]->title }}</h5>
                        </div>

                        <div class="exam-actions">

                            <div class="exam-check-icon">

                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-lg-3 right-side">
                    <div class="quick-questions-container">
                        <div class="quick-questions">

                            <div class="quick-questions-header">
                                <div class="i">
                                    <p>جميع الأسئلة</p>
                                    <span>{{ $data["count"] }}</span>
                                </div>
                                <div class="close-c">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <g transform="translate(12.000000, 12.000000) rotate(-45.000000) translate(-12.000000, -12.000000) translate(4.000000, 4.000000)" fill="#000000">
                                                <rect x="0" y="7" width="16" height="2" rx="1"/>
                                                <rect opacity="0.3" transform="translate(8.000000, 8.000000) rotate(-270.000000) translate(-8.000000, -8.000000) " x="0" y="7" width="16" height="2" rx="1"/>
                                            </g>
                                        </g>
                                    </svg>
                                </div>
                            </div>

                            <div class="quick-questions-content">
                                <?php $i=0 ?>
                                @foreach ($data["questions"] as $question)
                                    @if ($question->student_answer == $question->answer)
                                        <div class="question-number correct" data-question="{{ $question->id }}">{{ ++$i }}</div>
                                    @else
                                        <div class="question-number wrong" data-question="{{ $question->id }}">{{ ++$i }}</div>
                                    @endif
                                @endforeach
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-lg-9 left-side">

                    <div class="ques-container">
                        <div class="questions">

                            <div class="ques">
                                <?php $i=0;
                                $j=0 ?>

                                @foreach ($data["questions"] as $question)
                                    <div class="question_single">
                                        <div class="question_single-indivdaul">
                                            <div class="ques-head">

                                                <div class="text-sticker d-flex mr-auto">
                                                    <div class="hash">EXP</div>
                                                    <div class="exam-code">{{ $question->degree }}</div>                                                    <span class="hash">+ </span>
                                                </div>

                                                <div class="flag">
                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                            <rect x="0" y="0" width="24" height="24"/>
                                                            <path d="M8,4 L16,4 C17.1045695,4 18,4.8954305 18,6 L18,17.726765 C18,18.2790497 17.5522847,18.726765 17,18.726765 C16.7498083,18.726765 16.5087052,18.6329798 16.3242754,18.4639191 L12.6757246,15.1194142 C12.2934034,14.7689531 11.7065966,14.7689531 11.3242754,15.1194142 L7.67572463,18.4639191 C7.26860564,18.8371115 6.63603827,18.8096086 6.26284586,18.4024896 C6.09378519,18.2180598 6,17.9769566 6,17.726765 L6,6 C6,4.8954305 6.8954305,4 8,4 Z" fill="#000000"/>
                                                        </g>
                                                    </svg>
                                                </div>

                                            </div>

                                            <div class="question">
                                                <div class="question-content d-flex">
                                                    <h4 class="text-right"><span>{{ ++$i }}</span></h4>
                                                    <span id="question_id_{{ $question->id }}" class="hide">{{ $question->id }}</span>
                                                    <span id="question_id" class="hide">{{ $question->id }}</span>
                                                    <p>
                                                        <div class="flex column">
                                                            <span>
                                                                {{ $question->name }}
                                                            </span>

                                                            @if ($question->img)
                                                                <img class="image-question" src="{{ asset("app/" . $question->img) }}" alt="">
                                                            @endif
                                                        </div>
                                                    </p>
                                                </div>
                                            </div>


                                            <div class="questions-group">
                                                <div class="row">

                                                    @foreach (json_decode($question->chooses, true) as $choose)
                                                        @if (($choose== $question->answer) & ($question->answer == $question->student_answer))
                                                            <div class="col-md-6">
                                                                <div class="inputGroup">
                                                                    <input class="answer-check" name="radio" type="radio"/>
                                                                    <div class="abgd"> <!-- Class correct For Worng Answer -->
                                                                        <span>{{++$j}}</span>
                                                                    </div>
                                                                    <div class="answer">
                                                                        <p>{{ $choose }}</p>
                                                                        <span  class="text-left position-absolute pos-ele success">
                                                                            صحيح
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        @else
                                                            @if (($question->answer != $question->student_answer))
                                                                @if ($choose == $question->answer)
                                                                    <div class="col-md-6">
                                                                        <div class="inputGroup">
                                                                            <input class="answer-check" name="radio" type="radio"/>
                                                                            <div class="abgd"> <!-- Class correct For Worng Answer -->
                                                                                <span>{{++$j}}</span>
                                                                            </div>
                                                                            <div class="answer">
                                                                                <span class="text-left position-absolute pos-ele success">
                                                                                    الصح
                                                                                </span>
                                                                                <p>{{ $choose }}</p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                @elseif ($choose == $question->student_answer)
                                                                    <div class="col-md-6">
                                                                        <div class="inputGroup">
                                                                            <input class="answer-check" name="radio" type="radio"/>
                                                                            <div class="abgd"> <!-- Class correct For Worng Answer -->
                                                                                <span>{{++$j}}</span>
                                                                            </div>
                                                                            <div class="answer">
                                                                                <p>{{ $choose }}</p>
                                                                                <span class="text-left position-absolute pos-ele error">
                                                                                    الخطأ
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                @else
                                                                    <div class="col-md-6">
                                                                        <div class="inputGroup">
                                                                            <input class="answer-check" name="radio" type="radio"/>
                                                                            <div class="abgd"> <!-- Class correct For Worng Answer -->
                                                                                <span>{{++$j}}</span>
                                                                            </div>
                                                                            <div class="answer">
                                                                                <p>{{ $choose }}</p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                @endif
                                                            @else
                                                                <div class="col-md-6">
                                                                    <div class="inputGroup">
                                                                        <input class="answer-check" name="radio" type="radio"/>
                                                                        <div class="abgd"> <!-- Class correct For Worng Answer -->
                                                                            <span>{{++$j}}</span>
                                                                        </div>
                                                                        <div class="answer">
                                                                            <p>{{ $choose }}</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            @endif
                                                        @endif
                                                    @endforeach
                                                    <?php $j=0 ?>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-actions">
                                            <div class="form-button">
                                                <button class="btn next">
                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                            <polygon points="0 0 24 0 24 24 0 24"/>
                                                            <rect fill="#000000" opacity="0.3" transform="translate(8.500000, 12.000000) rotate(-90.000000) translate(-8.500000, -12.000000) " x="7.5" y="7.5" width="2" height="9" rx="1"/>
                                                            <path d="M9.70710318,15.7071045 C9.31657888,16.0976288 8.68341391,16.0976288 8.29288961,15.7071045 C7.90236532,15.3165802 7.90236532,14.6834152 8.29288961,14.2928909 L14.2928896,8.29289093 C14.6714686,7.914312 15.281055,7.90106637 15.675721,8.26284357 L21.675721,13.7628436 C22.08284,14.136036 22.1103429,14.7686034 21.7371505,15.1757223 C21.3639581,15.5828413 20.7313908,15.6103443 20.3242718,15.2371519 L15.0300721,10.3841355 L9.70710318,15.7071045 Z" fill="#000000" fill-rule="nonzero" transform="translate(14.999999, 11.999997) scale(1, -1) rotate(90.000000) translate(-14.999999, -11.999997) "/>
                                                        </g>
                                                    </svg>
                                                    التالى
                                                </button>
                                            </div>

                                            <div class="form-button">
                                                <button class="btn previous">
                                                    السابق
                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                            <polygon points="0 0 24 0 24 24 0 24"/>
                                                            <rect fill="#000000" opacity="0.3" transform="translate(12.000000, 12.000000) scale(-1, 1) rotate(-90.000000) translate(-12.000000, -12.000000) " x="11" y="5" width="2" height="14" rx="1"/>
                                                            <path d="M3.7071045,15.7071045 C3.3165802,16.0976288 2.68341522,16.0976288 2.29289093,15.7071045 C1.90236664,15.3165802 1.90236664,14.6834152 2.29289093,14.2928909 L8.29289093,8.29289093 C8.67146987,7.914312 9.28105631,7.90106637 9.67572234,8.26284357 L15.6757223,13.7628436 C16.0828413,14.136036 16.1103443,14.7686034 15.7371519,15.1757223 C15.3639594,15.5828413 14.7313921,15.6103443 14.3242731,15.2371519 L9.03007346,10.3841355 L3.7071045,15.7071045 Z" fill="#000000" fill-rule="nonzero" transform="translate(9.000001, 11.999997) scale(-1, -1) rotate(90.000000) translate(-9.000001, -11.999997) "/>
                                                        </g>
                                                    </svg>
                                                </button>
                                            </div>

                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>

                    <div class="answering-info">

                        <div class="answer-info-global">
                            <p class="opened"></p>
                            <span>السؤال الحالى</span>
                        </div>

                        <div class="answer-info-global">
                            <p class="correct"></p>
                            <span>صحيح</span>
                        </div>

                        <div class="answer-info-global">
                            <p class="wrong"></p>
                            <span>خاطئ</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section("script")
<script>
    question=document.getElementsByClassName("question_single")[0]
    ele=question.querySelector("#question_id").innerHTML;
    ele_q = document.querySelector(`[data-question="${ele}"]`);
    ele_q.classList.add("opened")

    next_btns=document.getElementsByClassName("next");
    Array.from(next_btns).forEach(function(ele,index){
        ele.addEventListener("click",function (){
            parent=this.parentNode
            question=parent.parentNode.parentNode
            next_question=question.nextElementSibling

            question.classList.add("hide")
            question.classList.remove("show")

            next_question.classList.add("show")

            if(question.classList.contains('hide')){
                question.classList.remove("hide")
                next_question.classList.remove("hide")
            }

            if(index == 0){
                question.classList.add("hide")
            }

            question_id=question.querySelector("#question_id").innerHTML

            ele_current = document.querySelector(`[data-question="${question_id}"]`);
            next_q_id=next_question.querySelector([`#question_id`]).innerHTML;
            eel_next=document.querySelector(`[data-question="${next_q_id}"]`)

            ele_current.classList.remove("opened")
            eel_next.classList.add("opened")
        })
    })

    questions=document.getElementsByClassName("question-number");
    Array.from(questions).forEach(function (element){
        element.addEventListener("click",function (){
            id=element.getAttribute("data-question")

            ele=document.querySelector([`#question_id_${id}`])
            ele_question=ele.parentNode.parentNode.parentNode.parentNode;

            all_questions=document.getElementsByClassName("question_single")
            Array.from(all_questions).forEach(ele => {
                ele.classList.add("hide")
            });

            all_questions_numbers=document.getElementsByClassName(["question-number"])
            Array.from(all_questions_numbers).forEach(question_ele => {
                question_ele.classList.remove("opened")
            });

            ele_question.classList.remove("hide")
            ele_question.classList.add("show")
            element.classList.add("opened")
        })
    })

    previous_btns=document.getElementsByClassName("previous");
    Array.from(previous_btns).forEach(function(ele,index){
        ele.addEventListener("click",function (){
            parent=this.parentNode
            question=parent.parentNode.parentNode
            previous_question=question.previousElementSibling

            question.classList.add("hide")
            question.classList.remove("show")

            previous_question.classList.remove("hide")
            previous_question.classList.add("show")

            question_id=question.querySelector("#question_id").innerHTML

            ele_current = document.querySelector(`[data-question="${question_id}"]`);
            previous_q_id=previous_question.querySelector([`#question_id`]).innerHTML;
            eel_previous=document.querySelector(`[data-question="${previous_q_id}"]`)

            ele_current.classList.remove("opened")
            eel_previous.classList.add("opened")
        })
    })
</script>
@endsection

@section("css")
<link rel="stylesheet" href="{{ asset("assets/exam.css") }}">
@endsection
