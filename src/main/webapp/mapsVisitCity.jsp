<%@ page import="WTT.Locatii" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css" integrity="sha384-5SOiIsAziJl6AWe0HWRKTXlfcSHKmYV4RBF18PPJ173Kzn7jzMyFuTtk8JA7QQG1" crossorigin="anonymous">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="resources/javascript/ajax.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <style>
        #map_wrapper {
            height: 400px;
        }

        #map_canvas {
            width: 100%;
            height: 100%;
        }

        .button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }
        .button5 {border-radius: 50%;}
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
    <%
        List<Locatii> lista = new ArrayList<>();
        List<Locatii> listaOraseVizitate = new ArrayList<>();
        lista =(List) session.getAttribute("listaLocatiiVizitate");
        listaOraseVizitate =(List) session.getAttribute("listaLocatii");
    %>

    <label for="location">Vizited city: <input style="margin-top:4%;" list="location" name="location" type="text">
    </label>
    <input id="hidden" type="hidden" value="<%=lista.size()%>">
    <datalist id="location">
       <%
            for (int i=0;i<lista.size();i++)
            {
        %>
        <option id="nume<%=i%>" value="<%=lista.get(i).getNumeOras()+"("+lista.get(i).getLat()+","+lista.get(i).getLon()+")"%>"><%=lista.get(i).getNumeOras()%></option>
        <%}%>
    </datalist>

    <label for="listaOraseVizitate">Search next location that you want to vizit: <input id="oraseVizitate" style="margin-top:4%;" list="listaOraseVizitate" name="locatiiVizitate" type="text">
    </label>
    <button class="button button5" onclick="searchPlacesInCity()">Search Places</button>
    <button class="button button5" onclick="searchHotelInCity()">Search hotel</button>
    <datalist id="listaOraseVizitate">
        <%
             for (int i=0;i<listaOraseVizitate.size();i++)
            {
        %>
        <option id="nume<%=i%>" value="<%=listaOraseVizitate.get(i).getNumeOras()+"("+listaOraseVizitate.get(i).getLat()+","+listaOraseVizitate.get(i).getLon()+")"%>"><%=listaOraseVizitate.get(i).getNumeOras()%></option>
        <%}%>
    </datalist>
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
        var infoWindowContent = {};
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
            // Info Window Content
            infoWindowContent[i] = [
                ['<div class="info_content">' +
                '<h3>London Eye</h3>' +
                '<p>The London Eye is a giant Ferris wheel situated on the banks of the River Thames. The entire structure is 135 metres (443 ft) tall and the wheel has a diameter of 120 metres (394 ft).</p>' +
                '<p>The London Eye is a giant Ferris wheel situated on the banks of the River Thames. The entire structure is 135 metres (443 ft) tall and the wheel has a diameter of 120 metres (394 ft).</p>' +
                '<p>The London Eye is a giant Ferris wheel situated on the banks of the River Thames. The entire structure is 135 metres (443 ft) tall and the wheel has a diameter of 120 metres (394 ft).</p>' +        '</div>'
                ]
        ];
        }
        // Display a map on the page
        map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
        map.setTilt(45);



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
                    infoWindow.setContent(infoWindowContent[i][0][0]);
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


    function searchHotelInCity(){
        searchHotel();
    }

    function searchPlacesInCity() {
        debugger;
        var value = document.getElementById('oraseVizitate').value;
        var latLong = value.substring(value.indexOf('(') + 1, value.indexOf(')'))
        var lat = latLong.split(',')[0];
        var long = latLong.split(',')[1];

        searchPlaces(lat,long);
    }
</script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBWcHMs7Fj2Ig8tFXXGVy1CYOeAiTg-9iI&callback=initMap">
</script>
</body>
</html>
