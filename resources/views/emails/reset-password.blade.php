<!DOCTYPE html>
<html>
<head>
    <title>Password Reset Code</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .header {
            text-align: center;
            padding: 20px 0;
            background-color: #007bff;
            color: #ffffff;
        }
        .content {
            margin: 20px 0;
        }
        .code {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            background-color: #f9f9f9;
            padding: 10px;
            margin: 20px 0;
            border: 1px solid #dddddd;
        }
        .footer {
            text-align: center;
            padding: 10px;
            font-size: 12px;
            color: #777777;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>طلب تغيير كلمة المرور</h1>
        </div>
        <div class="content">
            <p>Dear [User],</p>
            <p>لقد تلقينا طلبًا لإعادة تعيين كلمة المرور الخاصة بك. الرجاء استخدام الرمز التالي المكون من 6 أرقام لإعادة تعيين كلمة المرور الخاصة بك:</p>
            <div class="code">
                {{ $token }}
            </div>
            <p>هذا الرابط متاح ل 10 دقائق فقط من الان</p>
            <p>Thank you,</p>
            <p>Mr  Ahmed Elmahalwy Team</p>
        </div>
        <div class="footer">
            <p>&copy; 2024 [Ahmed Elmahalwy]. All rights reserved.</p>
        </div>
    </div>
</body>
</html>
