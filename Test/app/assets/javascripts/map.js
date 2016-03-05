      // This example enables Sign In by loading the Maps API with the signed_in
      // parameter set to true. For example:
      // https://maps.googleapis.com/maps/api/js?signed_in=true&amp;callback=initMap

function initMap() {
      var bounds = new google.maps.LatLngBounds();
      var map = new google.maps.Map(document.getElementById('map'),{
          zoom: 12,
          center: {lat: 36.9760799, lng: -121.9535941}
        });
    
    // Loop through our array of markers & place each one on the map  
    for( i = 0; i < gon['geolocs'].length; i++ ) {
        var position = new google.maps.LatLng(gon['geolocs'][i]['geoloc']['g_lat'], gon['geolocs'][i]['geoloc']['g_lon']);
        bounds.extend(position);
        marker = new google.maps.Marker({
            position: position,
            map: map
        });
      }        

      // Define the LatLng coordinates for the polygon.
  var triangleCoords = [
      {lat: 37.002723, lng: -122.072547},
      {lat: 36.977644, lng: -122.069170},
      {lat: 36.952884, lng: -122.069991},
      {lat: 36.950182, lng: -122.026415},
      {lat: 36.960476, lng: -122.001749},
      {lat: 37.009442, lng: -121.993892},
      {lat: 37.010879, lng: -122.049772},
      {lat: 37.002517, lng: -122.069256}
  ];

  // Construct the polygon.
  var bermudaTriangle = new google.maps.Polygon({
    paths: triangleCoords,
    strokeColor: '#FF0000',
    strokeOpacity: 0.8,
    strokeWeight: 3,
    fillColor: '#FF0000',
    fillOpacity: 0.35
  });
  bermudaTriangle.setMap(map);

  // Add a listener for the click event.
  bermudaTriangle.addListener('click', showArrays);

  infoWindow = new google.maps.InfoWindow;
  }


/** @this {google.maps.Polygon} */
function showArrays(event) {
  // Since this polygon has only one path, we can call getPath() to return the
  // MVCArray of LatLngs.
  var vertices = this.getPath();

  var contentString = '<b>Bermuda Triangle polygon</b><br>' +
      'Clicked location: <br>' + event.latLng.lat() + ',' + event.latLng.lng() +
      '<br>';

  // Iterate over the vertices.
  for (var i =0; i < vertices.getLength(); i++) {
    var xy = vertices.getAt(i);
    contentString += '<br>' + 'Coordinate ' + i + ':<br>' + xy.lat() + ',' +
        xy.lng();
  }

  // Replace the info window's content and position.
  infoWindow.setContent(contentString);
  infoWindow.setPosition(event.latLng);

  infoWindow.open(map);
}
