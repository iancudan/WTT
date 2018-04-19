<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>typeahead-addresspicker.js</title>
    <!--[if IE]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
<div id="main">
    <h1> Typeahead address picker</h1>
    <p>
        This is a quick full rewrite of my <a href="http://xilinus.com/jquery-addresspicker/demos/">jquery address picker plugin</a>,
        using <a href="http://twitter.github.io/typeahead.js/">typeahead autocomplete</a> from twitter and new google maps API: PlacesService and AutocompleteService
    </p>
    <h2> Without a map</h2>
    <div class="address-panel">
        <input id="address1" class="typeahead" type="text" placeholder="Enter an address">
        <h4>Response</h4>
        <pre class="response" id="response1">
        </pre>
    </div>
    <div style="clear:both"></div>

    <h2> With a map</h2>
    <div class="address-panel">
        <input id="address2" class="typeahead" type="text" placeholder="Enter an address">
        <h4>Response</h4>
        <pre class="response" id="response2">
        </pre>
    </div>
    <div id="map"></div>
    <div style="clear:both"></div>
    <h2>Explanations</h2>
    <p>
        The latest version of typeahead uses a class <code>Bloodhound</code> as source of autocomplete data. I just create my own class, derivated from <code>Bloodhound</code>
        The code is pretty straight forward
        <script type="text/javascript" src="https://gist.github.com/sgruhier/9273580.js"></script>
    </p>

</div>
</div>

<script src="http://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
<script src="../bower_components/jquery/jquery.js"></script>
<script src="../bower_components/typeahead.js/dist/bloodhound.js"></script>
<script src="../bower_components/typeahead.js/dist/typeahead.jquery.js"></script>
<script src="../dist/typeahead-addresspicker.js"></script>
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
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>typeahead-addresspicker.js</title>
    <!--[if IE]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
<div id="main">
    <h1> Typeahead address picker</h1>
    <p>
        This is a quick full rewrite of my <a href="http://xilinus.com/jquery-addresspicker/demos/">jquery address picker plugin</a>,
        using <a href="http://twitter.github.io/typeahead.js/">typeahead autocomplete</a> from twitter and new google maps API: PlacesService and AutocompleteService
    </p>

    <h2> With a map</h2>
    <div class="address-panel">
        <input id="address2" class="typeahead" type="text" placeholder="Enter an address">
        <h4>Response</h4>
        <pre class="response" id="response2">
        </pre>
    </div>
    <div id="map"></div>
    <div style="clear:both"></div>
    <h2>Explanations</h2>
    <p>
        The latest version of typeahead uses a class <code>Bloodhound</code> as source of autocomplete data. I just create my own class, derivated from <code>Bloodhound</code>
        The code is pretty straight forward
        <script type="text/javascript" src="https://gist.github.com/sgruhier/9273580.js"></script>
    </p>

</div>
</div>

<script src="http://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
<script src="resources/javascript/bower_components/jquery/jquery.js"></script>
<script src="resources/javascript/bower_components/typeahead.js/dist/bloodhound.js"></script>
<script src="resources/javascript/bower_components/typeahead.js/dist/typeahead.jquery.js"></script>
<script src="resources/javascript/dist/typeahead-addresspicker.js"></script>
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
