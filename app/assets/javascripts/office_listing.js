

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
			title: location
		});
		office_map.attach_message(location, marker);
	}, 

	attach_message: function(location, marker){
		var infowindow = new google.maps.InfoWindow(
			{content: "Address: " + location,
			size: new google.maps.Size(50,50)
		});
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(office_map.map, marker);
		});
	}
};
