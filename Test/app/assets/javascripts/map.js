      // This example enables Sign In by loading the Maps API with the signed_in
      // parameter set to true. For example:
      // https://maps.googleapis.com/maps/api/js?signed_in=true&amp;callback=initMap
function initMap() {
      var bounds = new google.maps.LatLngBounds();

        var map = new google.maps.Map(document.getElementById('map'),{
          zoom: 12,
          center: {lat: 36.9760799, lng: -121.9535941}
        });
      
        var markers = [
            ['London Eye, London', 36.9760799,-121.9535941],
            ['Palace of Westminster, London', 37.0731901,-122.0833359]
        ];

 // Display multiple markers on a map
    var infoWindow = new google.maps.InfoWindow(), marker, i;
    
    // Loop through our array of markers & place each one on the map  
    for( i = 0; i < gon['geolocs'].length; i++ ) {
        var position = new google.maps.LatLng(gon['geolocs'][i]['geoloc']['g_lat'], gon['geolocs'][i]['geoloc']['g_lon']);
        bounds.extend(position);
        marker = new google.maps.Marker({
            position: position,
            map: map
        });
      }        

  }