var map;
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
      zoom: 12,
      center: {lat: 36.9760799, lng: -121.9535941}
  });

  // NOTE: This uses cross-domain XHR, and may not work on older browsers.
  map.data.loadGeoJson('santa_cruz.json');

    // Set the stroke width, and fill color for each polygon
  map.data.setStyle({
    fillColor: 'green',
    strokeWeight: 1
  });
}
