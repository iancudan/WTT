<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">
    <link rel="stylesheet" href="resources/css/contact.css" >
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
            <h3>Contact us</h3>
            <div class="row">
                <form class="col s12" id="contact_form" action="contact" method="post">
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="name" type="text" name="name" required class="validate">
                            <label for="name">Name</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="emailFrom" type="email" name="emailFrom" value="<%=session.getAttribute("emailFrom")%>" required class="validate">
                            <label for="emailFrom">Email From</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="email" type="email" name="email" required class="validate">
                            <label for="email">Email</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <textarea id="subject" name="subject" class="materialize-textarea" class="validate" ></textarea>
                            <label for="subject">Subject </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <textarea id="message" name="message" class="materialize-textarea" class="validate" ></textarea>
                            <label for="message">Message</label>
                        </div>
                    </div>
                    <div>
                        <button class="waves-effect waves-light btn submitbtn" type="submit">Submit</button>
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
</body>
</html>