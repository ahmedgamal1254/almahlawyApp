<!DOCTYPE html>
<html>
<head>
    <title>Exam</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        @font-face {
            font-family: "Tajawal", sans-serif;
            src: url('https://fonts.googleapis.com/css2?family=Tajawal:wght@200;300;400;500;700;800;900&display=swa') format('truetype');
            font-weight: normal;
            font-style: normal;
        }
        body {
            font-family: "Tajawal", sans-serif;
            direction: rtl;
            text-align: right;
            margin: 20px;
            background-color: #f5f5f5;
            color: #333;
        }
        .header {
            text-align: center;
            padding: 20px;
            background-color: #2c3e50;
            color: #fff;
            border-radius: 8px;
            margin-bottom: 30px;
        }
        .header h1 {
            margin: 0;
            font-size: 2em;
        }
        .header p {
            margin: 5px 0;
            font-size: 1.2em;
        }
        .question {
            background: #fff;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .question-number {
            font-weight: bold;
            color: #e74c3c;
            margin-bottom: 10px;
        }
        .question-text {
            margin-bottom: 10px;
            font-size: 1.2em;
        }
        .question-image {
            text-align: center;
            margin-bottom: 10px;
        }
        .question-image img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        .question-answers {
            display: flex;
            flex-direction: column;
            padding: 10px 0;
            width: 100%;
        }
        .form-check {
            display: flex;
            align-items: center;
            margin-bottom: 8px;
        }
        .form-check input {
            margin-left: 10px;
        }
        .form-check-label {
            flex-grow: 1;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>{{ $exam->title }}</h1>
        <p>{{ $exam->stage->name }}</p>
    </div>
    @foreach($exam->questions as $index => $question)
        <div class="question">
            <div class="question-number">السؤال {{ $index + 1 }}</div>
            <div class="question-text">{{ $question->name }}</div>
            @if (!empty($question->img))
                <div class="question-image">
                    <img src="{{ asset("public/app/" . $question->img) }}" alt="Question Image">
                </div>
            @endif
            <div class="question-answers">
                @if (!empty($question->chooses))
                    @foreach (json_decode($question->chooses, true) as $choiceIndex => $choice)
                        <div class="form-check">
                            <span >{{ $chars[$choiceIndex] }} </span>
                            <input type="checkbox" id="choice{{ $index }}{{ $choiceIndex }}">
                            -
                            <label class="form-check-label" for="choice{{ $index }}{{ $choiceIndex }}">
                            {{ $choice }}
                            </label>
                        </div>
                    @endforeach
                @endif
            </div>
        </div>
    @endforeach
</body>
</html>
