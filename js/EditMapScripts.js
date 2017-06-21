var directionsService;
var directionsDisplay;


//load google map
function load()
{

    var myOptions =
    {
        center: new google.maps.LatLng(51.109985, 17.036225),
        zoom: 14,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        mapTypeControl: false,
        zoomControl: false,
        scaleControl: false,
        streetViewControl: false,
        draggable: false
    };

    directionsDisplay = new google.maps.DirectionsRenderer();
    map = new google.maps.Map( document.getElementById("map") , myOptions);

    if ( (start !== false) && (end !== false) ) {
       calculateAndDisplayRoute();
    }

    directionsDisplay.setMap(map);

}

function calculateAndDisplayRoute() {
    directionsService = new google.maps.DirectionsService;
    directionsService.route({
        origin: start,
        destination: end,
        waypoints: waypts,
        travelMode: 'DRIVING'
        }, function( response, status ) {
            if (status === 'OK') {

                directionsDisplay.setDirections( response );

            } else {
                window.alert('Directions request failed due to ' + status)
            }
        });
}

