var show_page_office_map = {
  map: null,

  display_map: function(lat, lng) {
    var map_center = new google.maps.LatLng(lat, lng);
    var mapOptions = {
      center: map_center,
      zoom: 16,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var canvas = $('#map-canvas2')[0];
    show_page_office_map.map = new google.maps.Map(canvas, mapOptions);

    var panoramaOptions = {
      position: map_center,
      pov: {
        heading: 34,
        pitch: 10
      }
    };
    var panorama = new google.maps.StreetViewPanorama(document.getElementById('pano'), panoramaOptions);
    show_page_office_map.map.setStreetView(panorama);
  },

  add_marker: function(lat, lng, location) {
    var latlng = new google.maps.LatLng(lat, lng);
    var marker = new google.maps.Marker({
      position: latlng,
      map: office_map.map,
      icon: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png',
      title: location
    });
  }
};

$(function() {
  $('#amenities-label').on('mouseover', function() {
    $('.amenities').slideDown('slow');
  });

  $('#amenities').on('mouseleave', function() {
    $('.amenities').slideUp('slow');
  });

  $('#basic-information-label').on('mouseover', function() {
    $('#basic-information-content').slideDown('fast');
  });

  $('#basic-information').on('mouseleave', function() {
    $('#basic-information-content').slideUp('fast');
  });

  $('#broker-information-label').on('mouseover', function() {
    $('#broker-information-content').slideDown('slow');
  });

  $('#broker-info').on('mouseleave', function() {
    $('#broker-information-content').slideUp('slow');
  });
 
});
