<html>
<head>
    <link rel="stylesheet" href="resources/css/login.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css" integrity="sha384-5SOiIsAziJl6AWe0HWRKTXlfcSHKmYV4RBF18PPJ173Kzn7jzMyFuTtk8JA7QQG1" crossorigin="anonymous">

    <header>
        <img src="/images/logo.png" alt="World Tips Travel" style="margin-left: 45%;"/>
    </header>
    <style>
        dialog {
            width: 500px;
            background:#e8e8e8;
            border: 1px solid #dadada;
            font-family:sans-serif;
            padding: 5px 10px 20px 20px;
        }
    </style>
</head>

<body>
<div class="login-page">
    <div class="form">
        <form class="register-form" action="sendemail" method="post">
            <input type="text" name="nameCreate"  placeholder="name"/>
            <input type="password" name="passwordCreate" placeholder="password"/>
            <input type="text" name="emailCreate"  placeholder="email address"/>
            <button>create</button>
            <p class="message">Already registered? <a href="#">Sign In</a></p>
        </form>
        <form class="login-form" action="userlogin" method="post">
            <input type="text" name="username" placeholder="username"/>
            <input type="password" name="password" placeholder="password"/>
            <button type="submit">login</button>
            <p class="message">Not registered? <a href="#">Create an account</a></p>
            <p class="message">If you have create an account please insert your verification code here</p>
            <p class="message"><a onclick="showDialog();">Check your code</a></p>
        </form>
    </div>
</div>
<form action="checkCode" method="post">
    <dialog id="window">
        <h3>Check Your Code!<i style="padding-left: 50%;" class="far fa-times-circle"><a onclick="closeDialog();">Close</a></i></h3>
        <p>We just send your authentification code on Email!Insert here:</p>
        <p></p>
        <input type="text" name="codeV" placeholder="Your Code Here"/>
        <input type="text" name="emailV" placeholder="Your Email Here"/>

        <p class="message"><a>Check your code</a></p>
        <input type="submit"/>
    </dialog>
</form>
<script type="text/javascript">
    $('.message a').click(function(){
        $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
    });
    function showDialog() {
        var dialog = document.getElementById('window');
        dialog.show();
    }
    function closeDialog(){
        var dialog = document.getElementById('window');
        dialog.close();
    }
</script>
</body>
</html>
