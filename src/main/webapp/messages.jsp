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
        .add-new-location {
            margin-top: -5%;
            margin-left: 77%;
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

<div class="add-new-location">
    <a href=""><i style="font-size: 25px;color:green" title="If your change are done, update the table!" class="fas fa-check"></i></a>
</div>
<form>
<div id="mytable">
    <table class="table table-bordered">
        <tr>
            <th><i class="fas fa-user"></i>User Name</th>
            <th><i class="far fa-inbox-out"></i>Email From</th>
            <th><i class="far fa-inbox-in"></i>Email To</th>
            <th><i class="far fa-comment"></i>Email Subject</th>
            <th><i class="far fa-sticky-note"></i>Email Body</th>
            <th><i class="far fa-calendar-alt"></i>ate And Time</th>
            <th><i class="far fa-envelope-open"></i>Read</th>
            <th><i class="fas fa-reply"></i>Reply</th>
        </tr>
        <%
            List<Email> lista = new ArrayList<>();
            lista =(List) session.getAttribute("messages");
            for (int i=0;i<lista.size();i++)
            {
                if(lista.get(i).getEmailRead() == 1){
        %>
        <tr>
            <td><%=lista.get(i).getNumeUtilizator()%></td>
            <td><%=lista.get(i).getEmailFrom()%></td>
            <td><%=lista.get(i).getEmailTo()%></td>
            <td><%=lista.get(i).getEmailSubject()%></td>
            <td><%=lista.get(i).getEmailBody()%></td>
            <td><%=lista.get(i).getEmailDateAndTime()%></td>
            <td><a onclick="readopenedEmail(<%=i%>)"><i id="readEmailOpen" style="font-size: 25px;color:green" title="If your change are done, update the table!" class="far fa-envelope-open"></i></a></td>
            <td><a><i style="font-size: 25px;" title="Reply" class="fas fa-reply-all"></i></a></td>
        </tr>
        <%
        }else {
        %>
        <tr>
            <td><%=lista.get(i).getNumeUtilizator()%></td>
            <td><%=lista.get(i).getEmailFrom()%></td>
            <td><%=lista.get(i).getEmailTo()%></td>
            <td><%=lista.get(i).getEmailSubject()%></td>
            <td><%=lista.get(i).getEmailBody()%></td>
            <td><%=lista.get(i).getEmailDateAndTime()%></td>
            <td><a onclick="readEmail(<%=i+1%>,'#readEmail<%=i+1%>')" ><i id="readEmail<%=i+1%>" style="font-size: 25px;color:green" title="If your change are done, update the table!" class="far fa-envelope"></i></a></td>
            <td><a onclick="update()"><i style="font-size: 25px;" title="Reply" class="fas fa-reply-all"></i></a></td>
        </tr>
        <%
            }
            }
        %>

    </table>

    <!-- The Modal -->
    <div id="myModal" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
            <div class="modal-header">
                <span class="close">&times;</span>
                <h4 ><b>Email Subject : </b></h4>
                <h4 id ="emailSubject"></h4>
            </div>
            <div class="modal-body">
                <p  style=" margin-top: -2%;"><b>FROM:</b></p>
                <p id="from"></p>
                <p><b>TO:</b></p>
                <p id="to"  style="padding-bottom: 3%;"></p>
                <p ><b>Email Body:</b></p>
                <p id="emailBody"></p>
            </div>
            <div class="modal-footer">
                <h4><b>Date and Time</b> </h4>
                <h4 id ="dateandtime"> </h4>
            </div>
        </div>

    </div>
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
        debugger;
        var myTable = document.getElementById('mytable');

            var oCells = myTable.children[0].rows.item(row).cells;
            var userName = oCells.item(0).innerHTML;
            var from = oCells.item(1).innerHTML;
            var to = oCells.item(2).innerHTML;
            var subject= oCells.item(3).innerHTML;
            var body = oCells.item(4).innerHTML;
            var dateandtime = oCells.item(5).innerHTML;

            document.getElementById('emailSubject').innerHTML += subject;
            document.getElementById('from').innerHTML += userName += '( '+from +' )';
            document.getElementById('to').innerHTML += to;
            document.getElementById('emailBody').innerHTML += body;
            document.getElementById('dateandtime').innerHTML += dateandtime;

        $(id).removeClass('far fa-envelope');
        $(id).addClass('far fa-envelope-open');


    }


    function readopenedEmail(row) {
        modal.style.display = "block";
        debugger;
        var myTable = document.getElementById('mytable');

        var oCells = myTable.children[0].rows.item(row).cells;
        var userName = oCells.item(0).innerHTML;
        var from = oCells.item(1).innerHTML;
        var to = oCells.item(2).innerHTML;
        var subject= oCells.item(3).innerHTML;
        var body = oCells.item(4).innerHTML;
        var dateandtime = oCells.item(5).innerHTML;

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


    function update(){
        var xmhr = new XMLHttpRequest();
        xmhr.onreadystatechange = function() {
            if (xmhr.readyState == 4) {
                var data = xmhr.responseText;
                alert("Response Data "+data);
            }
        }
        xmhr.open('POST', 'contact', true);
        xmhr.send(null);
    }

</script>
</body>
</html>