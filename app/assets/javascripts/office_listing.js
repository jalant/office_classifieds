var infowindow = null;

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
    google.maps.event.addListener(marker, 'click', function() {
      if (infowindow) {
        infowindow.close();
      };     
    infowindow = new google.maps.InfoWindow();
    infowindow.setContent("<div class='special2'> <a class='map-label' href ='office_listings/" + $('.ind-offices:contains(' + location.split(',')[0] + ')').first().data('id') + "'> Address: </a> <br> </div>"  + 
      "<a class='map-label2' href ='office_listings/" + $('.ind-offices:contains(' + location.split(',')[0] + ')').first().data('id') + "'>" + location + "</a>");
    infowindow.open(office_map.map, marker);
		});
	}
};

var office_map2= {
  map:null,

  display_map2: function(lat, lng){
    var map_center =  new google.maps.LatLng(lat, lng)
    var mapOptions = {
      center: map_center,
      zoom: 16,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var canvas=$('#map-canvas2')[0];
    office_map2.map = new google.maps.Map(canvas, mapOptions);

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

filters =  {
  filterData: { leaseType: '', price: '', squareFeet: ''},

  filterLeaseType: function(e) {
    filters.filterData.leaseType = $(event.target).val();
    console.log(filters.filterData.leaseType);
  },

  filterPrice: function(e) {
    filters.filterData.price = $(event.target).val();
    console.log(filters.filterData.price);
  },

  filterSquareFeet: function(e) {
    filters.filterData.squareFeet = $(event.target).val();
    console.log(filters.filterData.squareFeet);
  },

  applyFilters: function() {
    $('.ind-offices').fadeIn(1000);
    $('.ind-offices').each(function (index, Element) {
      filters.fadeElement(Element, 'lease-type', filters.filterData.leaseType);
      
      switch (filters.filterData.price) {
        case "$1000-3000":
          filters.fadeElementInRange(Element, 'price', 1000, 3000);
          break;
        case "$3000-5000":
          filters.fadeElementInRange(Element, 'price', 3000, 5000);
          break;
        case "$5000+":
          filters.fadeElementInRange(Element, 'price', 5000, 50000);
          break;
        }

      switch (filters.filterData.squareFeet) {
        case "0-1000":
          filters.fadeElementInRange(Element, 'square-feet', 0, 1000);
          break;
        case "1000-3000":
          filters.fadeElementInRange(Element, 'square-feet', 1000, 3000);
          break;
        case "3000+":
          filters.fadeElementInRange(Element, 'square-feet', 3000, 50000);
          break;
        }
      });
  },

  fadeElement: function(Element, dataSelector, filterData) {
    if ($(Element).data(dataSelector) !== filterData && filterData != '') {
      $(Element).fadeOut(1000);
    }
  },

  fadeElementInRange: function(Element, dataSelector, lowerBound, upperBound) {
    if (!($(Element).data(dataSelector) >= lowerBound && $(Element).data(dataSelector) <= upperBound)) {
      console.log($(Element).data(dataSelector))
      console.log(lowerBound);
      console.log(upperBound);
      $(Element).fadeOut(1000)
    }
  }
};

$(function() {
  $('#lease-type').change(filters.filterLeaseType);
  $('#price').change(filters.filterPrice);
  $('#square-feet').change(filters.filterSquareFeet);
  $('#apply-filters').click(filters.applyFilters);
});