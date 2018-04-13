<!DOCTYPE html>
<html>
<head>
    <style>
        #map {
            height: 400px;
            width: 100%;
        }
    </style>
</head>
<body>
<form action="">
    Search location:
    <input type="text" name="location" id="location">
    Lat:
    <input type="text" name="lat" id="lat">
    Long:
    <input type="text" name="lat" id="long">
    <button id="button" onclick="getLatLong()"></button>
</form>

<h3>My Google Maps Demo</h3>
<div id="map"></div>
<script type="text/javascript">
    function initMap() {
        var uluru = {lat: -25.363, lng: 131.044};
        var uluru1 = {lat: 51.507351, lng: -0.127758};
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 4,
            center: uluru
        });
        var marker = new google.maps.Marker({
            position: uluru,
            map: map
        });
        var marker1 = new google.maps.Marker({
            position: uluru1,
            map: map
        });
    }

    function getLatLong(){
        debugger;
        var array=["New York;","Barcelona"];
        var searchedCity = document.getElementById("location").value;
        for(var i =0;i<array.length;i++){
            if(searchedCity == array[i]){
                var lat =51.507351;
                var long = 1;
                location =new google.maps.LatLng(lat, long);
                addMarker(location)
            }
        }
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
