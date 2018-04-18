<%@ page import="WTT.Locatii" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        #map {
            height: 400px;
            width: 100%;
        }

        #map_wrapper {
            height: 400px;
        }

        #map_canvas {
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
<form action="">
    <%
        List<Locatii> lista = new ArrayList<>();
        lista =(List) session.getAttribute("listaLocatii");
    %>

    <label for="location">Search cars: <input list="location" name="location" type="text">
    </label>
    <input type="button" onclick="addMarker()">
    <input id="hidden" type="hidden" value="<%=lista.size()%>">
    <datalist id="location">
       <%
            for (int i=0;i<lista.size();i++)
            {
        %>
        <option id="nume<%=i%>" value="<%=lista.get(i).getNumeOras()+"("+lista.get(i).getLat()+","+lista.get(i).getLon()+")"%>"><%=lista.get(i).getNumeOras()%></option>
        <%}%>
    </datalist>
</form>

<h3>My Google Maps Demo</h3>
<div id="map_wrapper">
    <div id="map_canvas" class="mapping"></div>
</div>
<script type="text/javascript">
    function initMap() {
        var map;
        var bounds = new google.maps.LatLngBounds();
        var mapOptions = {
            mapTypeId: 'roadmap'
        };

        var dim =document.getElementById('hidden').value;
        var uluru = {};
        var markers = {};
        for(var i = 0;i<dim;i++) {
            var value = document.getElementById('nume' + i).value;
            var latLong = value.substring(value.indexOf('(') + 1, value.indexOf(')'))
            var lat = latLong.split(',')[0];
            var long = latLong.split(',')[1];
            uluru[i] = {lat: parseFloat(lat), lng: parseFloat(long)};
            // Multiple Markers
            markers[i] = [
                [value.substring(0,value.indexOf('(')), parseFloat(lat),parseFloat(long)]
            ];
        }
        // Display a map on the page
        map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
        map.setTilt(45);

        // Info Window Content
        var infoWindowContent = [
            ['<div class="info_content">' +
            '<h3>London Eye</h3>' +
            '<p>The London Eye is a giant Ferris wheel situated on the banks of the River Thames. The entire structure is 135 metres (443 ft) tall and the wheel has a diameter of 120 metres (394 ft).</p>' +        '</div>'],
            ['<div class="info_content">' +
            '<h3>Palace of Westminster</h3>' +
            '<p>The Palace of Westminster is the meeting place of the House of Commons and the House of Lords, the two houses of the Parliament of the United Kingdom. Commonly known as the Houses of Parliament after its tenants.</p>' +
            '</div>']
        ];

        // Display multiple markers on a map
        var infoWindow = new google.maps.InfoWindow(), marker, i;

        // Loop through our array of markers & place each one on the map
        for( i = 0; i < dim; i++ ) {
            debugger;
            var position = new google.maps.LatLng(markers[i][0][1], markers[i][0][2]);
            bounds.extend(position);
            marker = new google.maps.Marker({
                position: position,
                map: map,
                title: markers[i][0][0]
            });

            // Allow each marker to have an info window
            google.maps.event.addListener(marker, 'click', (function(marker, i) {
                return function() {
                    infoWindow.setContent(infoWindowContent[i][0]);
                    infoWindow.open(map, marker);
                }
            })(marker, i));

            // Automatically center the map fitting all markers on the screen
            map.fitBounds(bounds);
        }

        // Override our map zoom level once our fitBounds function runs (Make sure it only runs once)
        var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
            this.setZoom(14);
            google.maps.event.removeListener(boundsListener);
        });

    }

    function addMarker(location) {
        marker = new google.maps.Marker({
            position: location,
            map: map
        });
    }
</script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBWcHMs7Fj2Ig8tFXXGVy1CYOeAiTg-9iI&callback=initMap">
</script>
</body>
</html>
