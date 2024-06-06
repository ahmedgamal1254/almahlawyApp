@extends("student.layouts.master")

@section("title")
الامتحان {{$data["exam"]->code}}
@endsection

@section("content")
<div class="home-page">
    <div class="container">
        <div class="exam">
            <form action="{{route("exam_correct")}}" method="POST" id="correct_exam" class="form">
                <div class="row">
                    <div class="col-12">
                        <div class="exam-details">

                            <div class="exam-info">
                                <span class="tag">اختبار رقم {{$data["exam"]->code}}</span>
                                <h5>{{ $data["exam"]->title }}</h5>
                            </div>

                            <div class="exam-actions">
                                <div class="exam-time">
                                    <div class="timer">
                                        <p class="countdown">
                                            <div id="seconds"></div>:
                                            <div id="minutes"></div>:
                                            <div id="hours"></div>
                                        </p>
                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                <rect x="0" y="0" width="24" height="24"/>
                                                <path d="M12,21 C7.581722,21 4,17.418278 4,13 C4,8.581722 7.581722,5 12,5 C16.418278,5 20,8.581722 20,13 C20,17.418278 16.418278,21 12,21 Z" fill="#000000" opacity="0.3"/>
                                                <path d="M13,5.06189375 C12.6724058,5.02104333 12.3386603,5 12,5 C11.6613397,5 11.3275942,5.02104333 11,5.06189375 L11,4 L10,4 C9.44771525,4 9,3.55228475 9,3 C9,2.44771525 9.44771525,2 10,2 L14,2 C14.5522847,2 15,2.44771525 15,3 C15,3.55228475 14.5522847,4 14,4 L13,4 L13,5.06189375 Z" fill="#000000"/>
                                                <path d="M16.7099142,6.53272645 L17.5355339,5.70710678 C17.9260582,5.31658249 18.5592232,5.31658249 18.9497475,5.70710678 C19.3402718,6.09763107 19.3402718,6.73079605 18.9497475,7.12132034 L18.1671361,7.90393167 C17.7407802,7.38854954 17.251061,6.92750259 16.7099142,6.53272645 Z" fill="#000000"/>
                                                <path d="M11.9630156,7.5 L12.0369844,7.5 C12.2982526,7.5 12.5154733,7.70115317 12.5355117,7.96165175 L12.9585886,13.4616518 C12.9797677,13.7369807 12.7737386,13.9773481 12.4984096,13.9985272 C12.4856504,13.9995087 12.4728582,14 12.4600614,14 L11.5399386,14 C11.2637963,14 11.0399386,13.7761424 11.0399386,13.5 C11.0399386,13.4872031 11.0404299,13.4744109 11.0414114,13.4616518 L11.4644883,7.96165175 C11.4845267,7.70115317 11.7017474,7.5 11.9630156,7.5 Z" fill="#000000"/>
                                            </g>
                                        </svg>
                                    </div>
                                    <div class="time-progress">
                                        <div class="time-inner-progress" id="time-inner-progress"></div>
                                    </div>
                                </div>

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
                                        <div class="question-number" data-question="{{ $question->id }}">{{ ++$i }}</div>
                                    @endforeach
                                </div>

                                <div class="quick-questions-actions">
                                    <button class="finish" type="submit" class="submit">تسليم الإجابات</button>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-9 left-side">

                        <div class="ques-container">
                            <div class="questions">
                                <div class="ques">
                                    @csrf
                                    <input type="hidden" name="exam_id" id="exam_id" value="{{ $data["exam_id"] }}">
                                    <input type="hidden" name="teacher_id" value="{{ $data["teacher_id"] }}">
                                    <?php $i=0;
                                    $j=0 ?>

                                    @foreach ($data["questions"] as $question)
                                        <div class="question_single">
                                            <div class="question_single-indivdaul">
                                                <div class="ques-head">

                                                    <div class="text-sticker d-flex mr-auto">
                                                        <div class="hash">EXP</div>
                                                        <div class="exam-code">{{ $question->degree }}</div>
                                                        <span class="hash">+ </span>
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
                                                        <p>{{ $question->name }} ؟</p>
                                                    </div>
                                                </div>


                                                <div class="questions-group">
                                                    <div class="row">

                                                        @foreach (explode(",", $question->chooses) as $choose)
                                                        <div class="col-md-6">
                                                            <div class="inputGroup">
                                                                <input class="answer-check"
                                                                       name="question_answer_{{ $question->id }}"
                                                                       value="{{ $choose }}"
                                                                       type="radio"/>
                                                                <div class="abgd"> <!-- Class correct For Wrong Answer -->
                                                                    <span>{{ ++$j }}</span>
                                                                </div>
                                                                <div class="answer">
                                                                    <p>{{ $choose }}</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    @endforeach
                                                    <input class="answer-check"
                                                                       name="question_answer_{{ $question->id }}"
                                                                        value="answer_{{ $question->id }}"
                                                                        data-question_id="{{ $question->id }}"
                                                                        style="display: none;" checked
                                                                       type="radio"/>
                                                    <?php $j = 0 ?>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-actions">
                                                <div class="form-button">
                                                    <button class="btn next" type="button">
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
                                                    <button class="btn previous" type="button">
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
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection

@section("script")
<script>
document.getElementById("correct_exam").addEventListener('submit', function (e){
    e.preventDefault();

    confirm_exam_finished=confirm("أنت على وشك انهاء الامتحان هل أنت متأكد ؟")

    if(confirm_exam_finished){
        try {
            for (var i = 0; i <= localStorage.length; i++) {
                var key = localStorage.key(i);
                var value = localStorage.getItem(key);

                // Check if the value is a pattern question
                if (key.startsWith("question_")) {
                    question_id=key.split("_")[1]
                    exam_key=key.split("_")[2]
                    user_key=key.split("_")[3]

                    if(exam_id == exam_key & user_key == {{ Auth::user()->id }}){
                        localStorage.removeItem(key)
                    }
                }
            }
        } catch (error) {
            console.log(error)
        }

        document.getElementById("correct_exam").submit()
    }
});

// Function to submit the form
var diff = "{{ $data["exam_timer"] }}"; // Change this to the desired time in second

// Function to set the timer
function setTimer() {
    var interval = setInterval(function() {
    diff=diff-1;

    hours=Math.floor(diff/3600)
    minutes=Math.floor((diff % (60*60))/60)
    seconds=Math.floor(diff - ((hours*3600) + (minutes*60)))

    // Set the timer

    if(diff%60==0){
        $.ajax({
            url: "{{ route("exam_timer") }}",
            type: 'GET',
            data:{
                "exam_id":{{ $data["exam"]->id }},
                "exam_time":diff
            },
            success: function(data) {
                console.log(data)
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // Handle any errors
                console.log('Error:', textStatus, errorThrown);
            }
        });
    }

    // Display the countdown
    var countdown = document.getElementById("seconds");
    countdown.innerHTML = seconds < 10 ? `0${seconds}`:seconds;

    var countdown2 = document.getElementById("minutes");
    countdown2.innerHTML = minutes < 10 ? `0${minutes}`:minutes;;

    var countdown3 = document.getElementById("hours");
    countdown3.innerHTML = hours < 10 ? `0${hours}`:hours;;


    // Check if the time has finished
    if (diff < 0) {
        clearInterval(interval);
        try {
            for (var i = 0; i <= localStorage.length; i++) {
                var key = localStorage.key(i);
                var value = localStorage.getItem(key);

                // Check if the value is a pattern question
                if (key.startsWith("question_")) {
                    question_id=key.split("_")[1]
                    exam_key=key.split("_")[2]
                    user_key=key.split("_")[3]

                    if(exam_id == exam_key & user_key == {{ Auth::user()->id }}){
                        localStorage.removeItem(key)
                    }
                }
            }
        } catch (error) {

        }
        document.getElementById("correct_exam").submit()
    }

    localStorage.setItem("current_time_{{ $data["exam"]->id }}",diff)

    }, 1000);
}

setTimer()

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

        if(next_btns.length-2 == index){
            document.getElementById("submit").classList.add("show")
        }

        // save question answer in local storage question_examId_questionId ==> answer
        all_answered=question.querySelectorAll("input[type='radio']")

        answer=''
        // Loop through the radio buttons
        for (var i = 0; i < all_answered.length; i++) {
            var radioButton = all_answered[i];
            if (radioButton.checked) {
                answer=radioButton.value
                break;
            }
        }

        question_id=question.querySelector("#question_id").innerHTML
        exam_id=document.getElementById("exam_id").value
        user_id={{ Auth::user()->id }}

        localStorage.setItem(`question_${question_id}_${exam_id}_${user_id}`,answer)

        ele_current = document.querySelector(`[data-question="${question_id}"]`);
        next_q_id=next_question.querySelector([`#question_id`]).innerHTML;
        eel_next=document.querySelector(`[data-question="${next_q_id}"]`)

        ele_current.classList.remove("opened")
        eel_next.classList.add("opened")
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

        question_id=question.querySelector("#question_id").innerHTML

        previous_question.classList.remove("hide")
        previous_question.classList.add("show")

        ele_current = document.querySelector(`[data-question="${question_id}"]`);
        previous_q_id=previous_question.querySelector([`#question_id`]).innerHTML;
        eel_previous=document.querySelector(`[data-question="${previous_q_id}"]`)

        ele_current.classList.remove("opened")
        eel_previous.classList.add("opened")
    })
})

radio_btns=document.getElementsByClassName("answer-check")
Array.from(radioButton).forEach(function(ele,index){
    question_id=ele.getAttribute("data-question_id")
    exam_id=document.getElementById("exam_id").value
    user_id={{ Auth::user()->id }}

    localStorage.setItem(`question_${question_id}_${exam_id}_${user_id}`,ele.value)
})

exam_id=document.getElementById("exam_id").value;

for (var i = 0; i <= localStorage.length; i++) {
    var key = localStorage.key(i);
    var value = localStorage.getItem(key);

    // Check if the value is a pattern question
    if (key.startsWith("question_")) {
        question_id=key.split("_")[1]
        exam_key=key.split("_")[2]
        user_key=key.split("_")[3]

        ele=document.getElementById(`question_id_${question_id}`)
        ele=ele.parentElement.parentElement.parentElement
        answers=ele.querySelectorAll("input[type=radio]")

        if(exam_id == exam_key & user_key == {{ Auth::user()->id }}){
            for (var j = 0; j < answers.length; j++) {
                var radioButton = answers[j];
                if (value == radioButton.value) {
                    radioButton.checked=true
                }
            }
        }
    }
}
</script>
@endsection
