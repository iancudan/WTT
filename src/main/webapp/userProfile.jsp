<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">
    <link rel="stylesheet" href="resources/css/userProfile.css" >
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css" integrity="sha384-5SOiIsAziJl6AWe0HWRKTXlfcSHKmYV4RBF18PPJ173Kzn7jzMyFuTtk8JA7QQG1" crossorigin="anonymous">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
<body >
<!-- Navbar (sit on top) -->
<div class="w3-top">
    <div class="w3-bar w3-white w3-wide w3-padding w3-card">
        <a href="#home" class="w3-bar-item w3-button"><b>WTT</b> World Tips Travel</a>
        <!-- Float links to the right. Hide them on small screens -->
        <div class="w3-right w3-hide-small">
            <a href="/dashboard.jsp" class="w3-bar-item w3-button"><i class="fas fa-home"  title="Go to Menu"></i></a>
            <a href="#" class="w3-bar-item w3-button"><i class="fas fa-sign-out-alt" title="Sign Out"></i></a>
            <a href="#" class="w3-bar-item w3-button"><i class="fas fa-user" title="You are connected with <%=session.getAttribute("username")%>"></i></a>
        </div>
    </div>
</div>
<div class="container">
    <div class="imagebg"></div>
    <div class="container">
        <div class="form-container z-depth-5">
            <h3>Edit Profile</h3>
            <div class="row">
                <form class="col s12" id="contact_form" action="send_email" method="post">
                    <div onclick="editable()">
                        <i class="fas fa-edit" style="font-size: 25px;margin-left: 86%;">Edit</i>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="name" type="text" style="background: #f2f2f2;" name="name" value="Iancu Dan Silviu" required class="validate" readonly>
                            <label for="name">Name</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="email" type="email" style="background: #f2f2f2;" name="email" value="iancu@email.com" required class="validate" readonly>
                            <label for="email">Email</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="password" type="text" style="background: #f2f2f2;" name="name" required class="validate" readonly>
                            <label for="password">Password</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="repeatPassword" type="text" style="background: #f2f2f2;" name="name" required class="validate" readonly>
                            <label for="repeatPassword">Repeat Password</label>
                        </div>
                    </div>
                    <div>
                        <button class="waves-effect waves-light btn submitbtn" type="submit" re>Submit</button>
                    </div>
                </form>
                <div id="error_message" style="width:100%; height:100%; display:none; ">
                    <h4>
                        Error
                    </h4>
                    Sorry there was an error sending your form.
                </div>
                <div id="success_message" style="width:100%; height:100%; display:none; ">
                    <h4>
                        Success! Your Message was Sent Successfully.
                    </h4>
                </div>
            </div>
        </div>
    </div>
    <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
</div>
<script>
    function editable(){
        //remove attr
        $('#email').removeAttr("readonly");
        $('#email').removeAttr("style");
        $('#name').removeAttr("readonly");
        $('#name').removeAttr("style");
        $('#password').removeAttr("readonly");
        $('#password').removeAttr("style");
        $('#repeatPassword').removeAttr("readonly");
        $('#repeatPassword').removeAttr("style");

    }
</script>
</body>
</html>