<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="WTT.Locatii" %>

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
    <style type="text/css">
#mytable {
            margin: 0 auto;
            width: 60%;
            position: relative;
}
.header-h1 {
    margin-top: 2%;
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
</style>
</head>
<body>
<header class="codrops-header">
    <h1 class="header-h1">Perspective Page View Navigation <span>Transforms the page in 3D to reveal a menu</span></h1>
</header>

<div class="add-new-location">
    <a href=""><i style="font-size: 25px;color:green" title="If your change are done, update the table!" class="fas fa-check"></i></a>
    <a href="addlocation"><i style="font-size: 25px;"class="fas fa-plus" title="Add a new location"></i></a>
</div>
<div id="mytable">
    <table class="table table-bordered">
        <tr>
            <th>Number</th>
            <th>City Name</th>
            <th>Category I</th>
            <th>Category II</th>
            <th>Lat</th>
            <th>Long</th>
            <th>Update</th>
        </tr>
        <%
            List<Locatii> lista = new ArrayList<>();
            lista =(List) session.getAttribute("listaLocatii");
            for (int i=0;i<lista.size();i++)
            {
        %>
        <tr>
            <td><%=i+1%></td>
            <td contenteditable="true"> <%=lista.get(i).getNumeOras()%>  </td>
            <td contenteditable="true"><%=lista.get(i).getIdCat1()%> </td>
            <td contenteditable="true"><%=lista.get(i).getIdCat2()%> </td>
            <td contenteditable="true"><%=lista.get(i).getLat()%> </td>
            <td contenteditable="true"><%=lista.get(i).getLon()%> </td>
            <td><a href="addlocation"><i style="font-size: 25px;color:green" title="If your change are done, update the table!" class="fas fa-save"></i></a></td>
        </tr>
        <%
            }
        %>
    </table>
</div>
<script type="text/javascript" src="mydirectorypath/js/jQuery-2.1.4.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        // function to add row
        $('.add-row').click(function () {
            var $row = $('#mytable').find('tr.hidden').clone(true).removeClass('hidden');
            $('#mytable').find('table').append($row);
        });

        // function to remove row
        $('.delete-row').click(function () {
            $(this).parents('tr').detach();
        });
    });
</script>
</body>
</html>