<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <title>Editable table in HTML5</title>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport" >
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css" integrity="sha384-5SOiIsAziJl6AWe0HWRKTXlfcSHKmYV4RBF18PPJ173Kzn7jzMyFuTtk8JA7QQG1" crossorigin="anonymous">


    <style type="text/css">
    #mytable {
            margin: 0 auto;
            width: 60%;
            position: relative;
}

.glyphicon {
            font-size: 20px;
 }

.add-row {
            color: #32CD32;
        }

.add-row:hover {
            color: #228B22;
        }

.delete-row {
            color: #FF0000;
        }

.delete-row:hover {
            color: #B22222;
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
    <a href="#"><i style="font-size: 25px;" title="Save the new locations!" class="fas fa-save"></i></a>
</div>

<div id="mytable">
    <table class="table table-bordered">
        <tr>
            <th>City Name</th>
            <th>Category I</th>
            <th>Category II</th>
            <th>Lat</th>
            <th>Long</th>
            <th><span class="add-row glyphicon glyphicon-plus"></span></th>
        </tr>
        <!-- hidden row -->
        <tr class="hidden">
            <td contenteditable="true">NULL</td>
            <td contenteditable="true">NULL</td>
            <td contenteditable="true">NULL</td>
            <td contenteditable="true">NULL</td>
            <td contenteditable="true">NULL</td>
            <td><span class="delete-row glyphicon glyphicon-remove"></span></td>
        </tr>
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