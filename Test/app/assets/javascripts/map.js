      // This example enables Sign In by loading the Maps API with the signed_in
      // parameter set to true. For example:
      // https://maps.googleapis.com/maps/api/js?signed_in=true&amp;callback=initMap

var activeInfoWindow;

function initMap() {

      //Map options
      var bounds = new google.maps.LatLngBounds();
      var map = new google.maps.Map(document.getElementById('map'),{
          zoom: 12,
          center: {lat: 36.9760799, lng: -121.9535941}
        });
    
    //Loop through our array of markers & place each one on the map  
    for( i = 0; i < gon['geolocs'].length; i++ ) {
      //Gon Variables are passed as Google Map LatLng position variables
      var position = new google.maps.LatLng(gon['geolocs'][i]['geoloc']['g_lat'], gon['geolocs'][i]['geoloc']['g_lon']);
      bounds.extend(position);
      marker = new google.maps.Marker({
          position: position, 
          map: map
      });

      //Renders the marker on the specified map
     // marker.setMap(map);

      // create an InfoWindow - for mouseover
      var infoWnd = new google.maps.InfoWindow();

      // --------------------------
      // ON MOUSEOVER
      // --------------------------

      infoWnd.setContent('<div class="scrollFix">' + 'Welcome to ' +  position + '</div>');
      
      // add content to your InfoWindow
      infoWnd.setContent();
      
      // add listener on InfoWindow for mouseover event
      google.maps.event.addListener(marker, 'mouseover', function() {
        
        // Close active window if exists - [one might expect this to be default behaviour no?]        
        if(activeInfoWindow != null) activeInfoWindow.close();
      
        // Open new InfoWindow for mouseover event
        infoWnd.open(marker);

        // Store new open InfoWindow in global variable
        activeInfoWindow = infoWnd; 
      });       
      
      // on mouseout (moved mouse off marker) make infoWindow disappear
      google.maps.event.addListener(marker, 'mouseout', function() {
        infoWnd.close();  
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
      var santaCruz = new google.maps.Polygon({
        paths: triangleCoords,
        strokeColor: '#BDC3C7',
        strokeOpacity: 0.8,
        strokeWeight: 3,
        fillColor: '#EEEEEE',
        fillOpacity: 0.35
      });
      santaCruz.setMap(map);

      // Add a listener for the click event.
      santaCruz.addListener('click', showArrays);

      infoWindow = new google.maps.InfoWindow;
      }


    /** @this {google.maps.Polygon} */
    function showArrays(event) {
      // Since this polygon has only one path, we can call getPath() to return the
      // MVCArray of LatLngs.
      var vertices = this.getPath();

      var contentString = '<b>Santa Cruz city limits</b><br>' +
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
