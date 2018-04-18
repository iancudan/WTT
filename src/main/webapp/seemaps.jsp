<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Navigate to a city</title>
    <!--[if IE]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="resources/css/styles.css">
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
<div id="main" style="margin-top:7%">
    <h1>Navigate to a city</h1>
    <p>
        Navigate to a city
    </p>
    <h2>Choose a city that you want to visit</h2>
    <div class="address-panel">
        <input id="address2" class="typeahead" type="text" placeholder="Enter an address">
    </div>
    <div id="map"></div>


</div>
</div>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBWcHMs7Fj2Ig8tFXXGVy1CYOeAiTg-9iI&libraries=places"></script>
<script src="resources/javascript/bower_components/jquery/jquery.js"></script>
<script src="resources/javascript/bower_components/typeahead.js/dist/bloodhound.js"></script>
<script src="resources/javascript/bower_components/typeahead.js/dist/typeahead.jquery.js"></script>
<script src="resources/javascript/typeahead-addresspicker.js"></script>
<script>
    function displayResults(result, div) {
        html = ["Address: " + result.address()]
        html.push("Latitude: " + result.lat())
        html.push("Longitude: " + result.lng())
        html.push("Long names:")
        result.addressTypes().forEach(function(type) {
            html.push("  " + type + ": " + result.nameForType(type))
        })
        html.push("Short names:")
        result.addressTypes().forEach(function(type) {
            html.push("  " + type + ": " + result.nameForType(type, true))
        })
        div.html( html.join('\n'));
    }

    $( function() {
        var addressPicker = new AddressPicker();
        $('#address1').typeahead(null, {
            displayKey: 'description',
            source: addressPicker.ttAdapter()
        });
        addressPicker.bindDefaultTypeaheadEvent($('#address1'))
        $(addressPicker).on('addresspicker:selected', function (event, result) { displayResults(result, $('#response1'))})
        $(addressPicker).on('addresspicker:predictions', function(event, result) {
            if (result && result.length > 0)
                $('#address1').removeClass("empty")
            else
                $('#address1').addClass("empty")
        })
    })

    $( function() {
        // instantiate the addressPicker suggestion engine (based on bloodhound)
        var addressPicker = new AddressPicker({map: {id: '#map'}, marker: {draggable: true, visible: true}, zoomForLocation: 18, reverseGeocoding: true});

        // instantiate the typeahead UI
        $('#address2').typeahead(null, {
            displayKey: 'description',
            source: addressPicker.ttAdapter()
        });
        addressPicker.bindDefaultTypeaheadEvent($('#address2'))
        $(addressPicker).on('addresspicker:selected', function (event, result) {
            displayResults(result, $('#response2'))
            if (result.isReverseGeocoding()) {
                $('#address2').val(result.address())
            }
        });
    })


</script>

</body>
</html>
