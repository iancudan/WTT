<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="resources/css/success.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css" integrity="sha384-5SOiIsAziJl6AWe0HWRKTXlfcSHKmYV4RBF18PPJ173Kzn7jzMyFuTtk8JA7QQG1" crossorigin="anonymous">

</head>
<body>
<!-- Navbar (sit on top) -->
<div class="w3-top">
    <div class="w3-bar w3-white w3-wide w3-padding w3-card">
        <a href="#home" class="w3-bar-item w3-button"><b>WTT</b> World Tips Travel</a>
        <!-- Float links to the right. Hide them on small screens -->
        <div class="w3-right w3-hide-small">
            <a href="dashboardMenu" class="w3-bar-item w3-button"><i class="fas fa-home"  title="Go to Menu"></i></a>
            <a href="#" class="w3-bar-item w3-button"><i class="fas fa-sign-out-alt" title="Sign Out"></i></a>
            <a href="#" class="w3-bar-item w3-button"><i class="fas fa-user" title="You are connected with <%=session.getAttribute("username")%>"></i></a>
        </div>
    </div>
</div>
<div class="qlt-confirmation">
    <div class="panel panel-default">
        <div class="panel-body">
            <center>
                <img src="https://cdn4.iconfinder.com/data/icons/social-communication/142/open_mail_letter-512.png" style="width:30px; height: 30px;">
                <p class="desc">Thank you for signing up!<br>We've sent a confirmation link on your email.<br>Please visit your <img style="width: 40px; height: 40px" src="http://cdn.mysitemyway.com/etc-mysitemyway/icons/legacy-previews/icons/glossy-black-icons-business/080840-glossy-black-icon-business-mailbox.png">.</p>
            </center>
            <p class="notice">Note:<br>Using our <b>social login</b>, you will be ask to add your email address during authentication. This is part of our security policy.</p>
        </div>
    </div>
</div>
</body>

</html>
