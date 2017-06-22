var directionsService;
var directionsDisplay;


//load google map
function load()
{

    var myOptions =
    {
        center: new google.maps.LatLng(51.109985, 17.036225),
        zoom: 13,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        mapTypeControl: false,
        zoomControl: false,
        scaleControl: false,
        streetViewControl: false,
        //draggable: false
    };

    directionsDisplay = new google.maps.DirectionsRenderer({suppressMarkers:true }) //, preserveViewport: true});
    var map = new google.maps.Map( document.getElementById("map") , myOptions);

    directionsDisplay.setMap(map);
    if ( (start !== false) && (end !== false) ) {        
       calculateAndDisplayRoute();
       drawMarkers(map);
    }



}

function calculateAndDisplayRoute() {
    directionsService = new google.maps.DirectionsService;
    directionsService.route({
        origin: start,
        destination: end,
        waypoints: waypts,
        optimizeWaypoints: true,
        travelMode: 'WALKING'
        }, function( response, status ) {
            if (status === 'OK') {

                directionsDisplay.setDirections( response );

            } else {
                window.alert('Directions request failed due to ' + status)
            }
        });
}

function drawMarkers(map) {

    var wayptsIcon = {
        url: "icon/icon.png",
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(5, 10),
        scaledSize: new google.maps.Size(20, 20)
      };

    var endIcon = {
        url: "icon/destination.svg",
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(5, 10),
        scaledSize: new google.maps.Size(35, 35)
      };

    var startIcon = {
        url: "icon/startIcon.svg",
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(5, 15),
        scaledSize: new google.maps.Size(35, 35)
      };

    for( var i = 0; i < waypts.length; i++ ) {
        var position = waypts[i].location;
        marker = new google.maps.Marker({
            position: position,
            map: map,
            icon: wayptsIcon
        });
    }

    var startMarker = new google.maps.Marker({ position: start, map:map, icon: startIcon} );
    var endMarker = new google.maps.Marker({ position: end, map:map, icon: endIcon });

}

