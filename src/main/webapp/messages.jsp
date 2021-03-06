<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="WTT.Locatii" %>
<%@ page import="WTT.Utilizator" %>
<%@ page import="WTT.Email" %>

<!DOCTYPE html>
<html>
<head>
    <title>Editable table in HTML5</title>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport" >
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css" integrity="sha384-5SOiIsAziJl6AWe0HWRKTXlfcSHKmYV4RBF18PPJ173Kzn7jzMyFuTtk8JA7QQG1" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="resources/javascript/ajax.js"></script>

    <link rel="stylesheet" type="text/css" href="resources/css/table.css" />
    <style type="text/css">
        #mytable {
            margin: 0 auto;
            width: 60%;
            position: relative;
        }
        .header-h1 {
            margin-top: 4%;
            margin-left: 17%;
            padding-bottom: 6%;
            font-weight: 300;
            font-size: 2.625em;
            line-height: 1.3;
        }
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            -webkit-animation-name: fadeIn; /* Fade in the background */
            -webkit-animation-duration: 0.4s;
            animation-name: fadeIn;
            animation-duration: 0.4s
        }

        /* Modal Content */
        .modal-content {
            position: fixed;
            bottom: 30%;
            background-color: #fefefe;
            width: 100%;
            -webkit-animation-name: slideIn;
            -webkit-animation-duration: 0.4s;
            animation-name: slideIn;
            animation-duration: 0.4s
        }

        /* The Close Button */
        .close {
            color: white;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }

        .modal-header {
            padding: 2px 16px;
            background-color: #5cb85c;
            color: white;
        }

        .modal-body {padding: 70px 16px;}

        .modal-footer {
            padding: 2px 16px;
            background-color: #5cb85c;
            color: white;
        }

        /* Add Animation */
        @-webkit-keyframes slideIn {
            from {bottom: -300px; opacity: 0}
            to {bottom: 0; opacity: 1}
        }

        @keyframes slideIn {
            from {bottom: -300px; opacity: 0}
            to {bottom: 0; opacity: 1}
        }

        @-webkit-keyframes fadeIn {
            from {opacity: 0}
            to {opacity: 1}
        }

        @keyframes fadeIn {
            from {opacity: 0}
            to {opacity: 1}
        }
    </style>
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
<header class="codrops-header">
    <h1 class="header-h1">Perspective Page View Navigation <span>Transforms the page in 3D to reveal a menu</span></h1>
</header>

<form>
<div id="mytable">
    <table class="table table-bordered">
        <tr>
            <th><i class="fas fa-user"></i>ID</th>
            <th><i class="fas fa-user"></i><p>User Name</p></th>
            <th><i class="fas fa-share-square"></i><p>Email From</th>
            <th><i class="far fa-hand-receiving"></i><p>Email To</th>
            <th><i class="far fa-comment"></i><p>Email Subject</th>
            <th><i class="far fa-sticky-note"></i><p>Email Body</th>
            <th><i class="far fa-calendar-alt"></i><p>Date And Time</th>
            <th><i class="far fa-envelope-open"></i><p>Read</th>
        </tr>
        <%
            List<Email> lista = new ArrayList<>();
            lista =(List) session.getAttribute("messages");
            for (int i=0;i<lista.size();i++)
            {
                if(lista.get(i).getEmailRead() == 1){
        %>
        <tr>
            <td><%=lista.get(i).getId()%></td>
            <td><%=lista.get(i).getNumeUtilizator()%></td>
            <td><%=lista.get(i).getEmailFrom()%></td>
            <td><%=lista.get(i).getEmailTo()%></td>
            <td><%=lista.get(i).getEmailSubject()%></td>
            <td><%=lista.get(i).getEmailBody()%></td>
            <td><%=lista.get(i).getEmailDateAndTime()%></td>
            <td><a onclick="readopenedEmail(<%=i+1%>)"><i id="readEmailOpen" style="font-size: 25px;color:green" title="If your change are done, update the table!" class="far fa-envelope-open"></i></a></td>
        </tr>
        <%
        }else {
        %>
        <tr>
            <td><%=lista.get(i).getId()%></td>
            <td><%=lista.get(i).getNumeUtilizator()%></td>
            <td><%=lista.get(i).getEmailFrom()%></td>
            <td><%=lista.get(i).getEmailTo()%></td>
            <td><%=lista.get(i).getEmailSubject()%></td>
            <td><%=lista.get(i).getEmailBody()%></td>
            <td><%=lista.get(i).getEmailDateAndTime()%></td>
            <td><a onclick="readEmail(<%=i+1%>,'#readEmail<%=i+1%>')" ><i id="readEmail<%=i+1%>" style="font-size: 25px;color:green" title="If your change are done, update the table!" class="far fa-envelope"></i></a></td>
        </tr>
        <%
            }
            }
        %>

    </table>

    <!-- The Modal -->
    <form action="replyMail" method="post">
    <div id="myModal" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <div class="modal-header">
                <span class="close">&times;</span>
                <h4 ><b>Email Subject : </b></h4>
                <h4 name="emailSubject" id ="emailSubject"></h4>
                <a onclick="replyEmail()"><i style="font-size: 25px;" title="Reply" class="fas fa-reply-all"></i></a>
            </div>
            <div class="modal-body">
                <p  style=" margin-top: -2%;"><b>FROM:</b></p>
                <p name="from" id="from"></p>
                <p><b>TO:</b></p>
                <p name="to" id="to"  style="padding-bottom: 3%;"></p>
                <p ><b>Email Body:</b></p>
                <p name="emailBody" id="emailBody"></p>
            </div>
            <div class="modal-footer">
                <h4><b>Date and Time</b> </h4>
                <h4 name="dateandtime" id ="dateandtime"></h4>
            </div>
        </div>
    </div>
    </form>
</div>
</form>
<script type="text/javascript">
    $(document).ready(function() {
        $('.add-row').click(function () {
            var $row = $('#mytable').find('tr.hidden').clone(true).removeClass('hidden');
            $('#mytable').find('table').append($row);
        });

        $('.delete-row').click(function () {
            $(this).parents('tr').detach();
        });
    });

    var modal = document.getElementById('myModal');
    var span = document.getElementsByClassName("close")[0];

    function readEmail(row,id) {


        document.getElementById('emailSubject').innerHTML = "";
        document.getElementById('from').innerHTML = "";
        document.getElementById('to').innerHTML = "";
        document.getElementById('emailBody').innerHTML = "";
        document.getElementById('dateandtime').innerHTML = "";

        modal.style.display = "block";
        var myTable = document.getElementById('mytable');

            var oCells = myTable.children[0].rows.item(row).cells;
            var idEmail = oCells.item(0).innerHTML;
            var userName = oCells.item(1).innerHTML;
            var from = oCells.item(2).innerHTML;
            var to = oCells.item(3).innerHTML;
            var subject= oCells.item(4).innerHTML;
            var body = oCells.item(5).innerHTML;
            var dateandtime = oCells.item(6).innerHTML;

            document.getElementById('emailSubject').innerHTML += subject;
            document.getElementById('from').innerHTML += from;
            document.getElementById('to').innerHTML += to;
            document.getElementById('emailBody').innerHTML += body;
            document.getElementById('dateandtime').innerHTML += dateandtime;

        $(id).removeClass('far fa-envelope');
        $(id).addClass('far fa-envelope-open');

        readEmailCall(idEmail);
    }


    function readopenedEmail(row) {

        document.getElementById('emailSubject').innerHTML = "";
        document.getElementById('from').innerHTML = "";
        document.getElementById('to').innerHTML = "";
        document.getElementById('emailBody').innerHTML = "";
        document.getElementById('dateandtime').innerHTML = "";

        modal.style.display = "block";
        var myTable = document.getElementById('mytable');

        var oCells = myTable.children[0].rows.item(row).cells;
        var userName = oCells.item(1).innerHTML;
        var from = oCells.item(2).innerHTML;
        var to = oCells.item(3).innerHTML;
        var subject= oCells.item(4).innerHTML;
        var body = oCells.item(5).innerHTML;
        var dateandtime = oCells.item(6).innerHTML;


        document.getElementById('emailSubject').innerHTML += subject;
        document.getElementById('from').innerHTML += from;
        document.getElementById('to').innerHTML += to;
        document.getElementById('emailBody').innerHTML += body;
        document.getElementById('dateandtime').innerHTML += dateandtime;

    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }


    function replyEmail(){
        debugger;
        var emailSubject= document.getElementById('emailSubject').innerHTML ;
        var emailTo= document.getElementById('from').innerHTML ;
        var emailFrom = document.getElementById('to').innerHTML ;

        replyEmailCall(emailSubject,emailTo,emailFrom);
    }
</script>
</body>
</html>