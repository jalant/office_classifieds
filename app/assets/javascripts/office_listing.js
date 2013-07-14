var infowindow;

var office_map = {
	map: null,

	display_map: function(lat, lng){
		var mapOptions = {
			center:	new google.maps.LatLng(lat, lng),
			zoom: 15,
			mapTypeId: google.maps.MapTypeId.ROADMAP
		};
		var canvas=$('#map-canvas')[0];
		office_map.map =	new google.maps.Map(canvas, mapOptions);
	},

	add_marker: function(lat, lng, location){
		var latlng = new google.maps.LatLng(lat, lng);
		var marker = new google.maps.Marker({
			position: latlng,
			map: office_map.map,
			icon: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png',
			title: location
		});
		office_map.attach_message(location, marker);
	},

	attach_message: function(location, marker){
		infowindow = new google.maps.InfoWindow();
		infowindow.setContent("<div class='special2'> <a class='map-label' href ='office_listings/" + $('.ind-offices:contains(' + location.split(',')[0] + ')').first().data('id') + "'> Address: </a> <br> </div>"  + 
			"<a class='map-label2' href ='office_listings/" + $('.ind-offices:contains(' + location.split(',')[0] + ')').first().data('id') + "'>" + location + "</a>");
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(office_map.map, marker);
		});
	}
};

var office_map2= {
	map:null,

	display_map2: function(lat, lng){
		var map_center = 	new google.maps.LatLng(lat, lng)
		var mapOptions = {
			center: map_center,
			zoom: 16,
			mapTypeId: google.maps.MapTypeId.ROADMAP
		};

		var canvas=$('#map-canvas2')[0];
		office_map2.map =	new google.maps.Map(canvas, mapOptions);

		var panoramaOptions = {
    position: map_center,
    pov: {
      heading: 34,
      pitch: 10
    }
  };
  	var panorama = new google.maps.StreetViewPanorama(document.getElementById('pano'),panoramaOptions);
  	office_map2.map.setStreetView(panorama);
	},

	add_marker2: function(lat, lng, location){
		var latlng = new google.maps.LatLng(lat, lng);
		var marker = new google.maps.Marker({
			position: latlng,
			map: office_map.map,
			icon: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png',
			title: location
		});
	}
};

