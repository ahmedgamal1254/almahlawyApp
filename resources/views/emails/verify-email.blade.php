<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Email Verification</title>
    <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .header {
            text-align: center;
            padding-bottom: 20px;
        }
        .content {
            padding: 20px;
        }
        .content h1 {
            font-size: 24px;
            color: #333333;
            text-align: center;
        }
        .content p {
            font-size: 16px;
            color: #666666;
            line-height: 1.5;
            text-align: center;
        }
        .code {
            display: inline-block;
            padding: 10px 20px;
            margin: 20px 0;
            font-size: 24px;
            color: #ffffff;
            background-color: #007BFF;
            border-radius: 5px;
        }
        .footer {
            text-align: center;
            padding: 10px;
            font-size: 12px;
            color: #999999;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>تفعيل البريد الالكترونى</h1>
        </div>
        <div class="content">
            <p>Hi [{{ $user->name }}],</p>
            <p>للتحقق من عنوان بريدك الإلكتروني، يرجى استخدام رمز التحقق التالي المكون من 6 أرقام:</p>
            <div class="code">[{{ $token }}]</div>
            <p>.هذا الرمز متاح لمدة ساعة واحدة فقط من الان</p>
        </div>
        <div class="footer">
            &copy; 2024 Ahmed Elmahlawy. All rights reserved.
        </div>
    </div>
</body>
</html>
