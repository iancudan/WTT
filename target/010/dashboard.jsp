<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Perspective Page View Navigation</title>
    <meta name="description" content="Perspective Page View Navigation: Transforms the page in 3D to reveal a menu" />
    <meta name="keywords" content="3d page, menu, navigation, mobile, perspective, css transform, web development, web design" />
    <meta name="author" content="Codrops" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css" integrity="sha384-5SOiIsAziJl6AWe0HWRKTXlfcSHKmYV4RBF18PPJ173Kzn7jzMyFuTtk8JA7QQG1" crossorigin="anonymous">

    <link rel="shortcut icon" href="../favicon.ico">
    <link rel="stylesheet" type="text/css" href="resources/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/component.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/dashboard.css" />
    <!-- csstransforms3d-shiv-cssclasses-prefixed-teststyles-testprop-testallprops-prefixes-domprefixes-load -->
    <script src="resources/javascript/modernizr.custom.25376.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%
    if(session.getAttribute("username")== null){
        response.sendRedirect("login.jsp");
    }
%>
<div id="perspective" class="perspective effect-rotateleft">
    <div class="container">
        <div class="wrapper"><!-- wrapper needed for scroll -->
            <!-- Top Navigation -->
            <div class="codrops-top clearfix">
                <div class="dropdown">
                    <span><i class="fas fa-user"> <%=session.getAttribute("username")%></i></span>
                    <div class="dropdown-content">
                        <p><a href="logout">Log out</a></p>
                    </div>
                </div>
          </div>
            <header class="codrops-header">
                <h1>Perspective Page View Navigation <span>Transforms the page in 3D to reveal a menu</span></h1>
            </header>
            <div class="main clearfix">
                <div class="column">
                    <p><button id="showMenu">Show Menu</button></p>
                    <p>Click on this button to see the content being pushed away in 3D to reveal a navigation or other items.</p>
                </div>
                <div class="column">
                    <nav class="codrops-demos">
                        <a href="index3.html" class="current-demo">Rotate Left</a>
                    </nav>
                </div>
                <div class="related">
                    <p>We have nothing to lose and a world to see</p>
                </div>
            </div><!-- /main -->
        </div><!-- wrapper -->
    </div><!-- /container -->
    <nav class="outer-nav right vertical">
        <% String user = session.getAttribute("userRole").toString();
            if(user.equals("ADMIN")){
        %>
        <a href="adminlocation"> <i class="fas fa-plane">Admin Locations</i></a>
        <a href="adminUser"> <i class="fas fa-users">Admin Users</i></a>
        <a href="messages"> <i class="fas fa-envelope">Messages<span class="menu-badge"><span class="badge vd_bg-red"><%=session.getAttribute("numarMesaje")%></span></span> </i></a>
        <%
            }else{

        %>
        <a href="/login/userProfile.jsp"> <i class="fas fa-user-secret">Security</i></a>
        <a href="todolist"> <i class="fas fa-list-ol">My Bag</i></a>
        <a href="/login/maps.jsp"> <i class="fas fa-map">See your city</i></a>
        <a href="contact"> <i class="fas fa-at">Contact us</i></a>
        <%
            }
        %>
    </nav>
</div><!-- /perspective -->
<script src="resources/javascript/classie.js"></script>
<script src="resources/javascript/menu.js"></script>
</body>
</html>