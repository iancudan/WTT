<html lang="en">
<head>
    <meta charset="utf-8">
    <title>typeahead-addresspicker.js</title>
    <!--[if IE]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="resources/css/styles.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css" integrity="sha384-5SOiIsAziJl6AWe0HWRKTXlfcSHKmYV4RBF18PPJ173Kzn7jzMyFuTtk8JA7QQG1" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="resources/javascript/ajax.js"></script>
</head>

<body>
<div id="main">
    <h2> With a map</h2>
    <div class="address-panel">
        <input id="address2" class="typeahead" type="text" placeholder="Enter an address">
        <h4>Response</h4>
        <pre class="response" id="response2">
        </pre>
    </div>
    <div id="map"></div>
    <div style="clear:both"></div>
    <input type="hidden" id="lat" >
    <input type="hidden" id="lon" >
    <h2><a onclick="searchAdressInCity()"><i class="fas fa-map-marker">Search a place neaby this place</i></a></h2>

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
        document.getElementById('lat').value = result.lat();
        document.getElementById('lon').value = result.lng();
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
    function searchAdressInCity() {
        searchPlaces( parseFloat(document.getElementById('lat').value),parseFloat(document.getElementById('lon').value));
    }

</script>

</body>
</html>
