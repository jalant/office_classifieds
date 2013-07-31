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
  // stores current 'state' of filters as defined by user input
  filterData: { leaseType: '', priceUpper: '', priceLower: '', squareFeet: ''},

  filterLeaseType: function(e) {
    filters.filterData.leaseType = $(event.target).val();
  },

  filterPrice: function(priceLower, priceUpper) {
    filters.filterData.priceLower = priceLower;
    filters.filterData.priceUpper = priceUpper;
    console.log(filters.filterData.priceLower);
    console.log(filters.filterData.priceUpper);
  },

  filterSquareFeet: function(e) {
    filters.filterData.squareFeet = $(event.target).val();
  },

  applyFilters: function() {
    $('.ind-offices').each(function (index, Element) {
      $(Element).removeClass('show');
      $(Element).removeClass('fade');
      filters.fadeElement(Element, 'lease-type', filters.filterData.leaseType);
     
      switch (filters.filterData.price) {
        case "$0-3000":
          filters.fadeElementInRange(Element, 'price', 0, 3000);
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
      if (!($(Element).hasClass('fade'))) {
        // Add show class if no fade elements applied in filter chain
        $(Element).addClass('show');
      }
    });
    // $('.show').fadeIn(0);
    $('.show').show();
    $('.fade').hide();
  },

  fadeElement: function(Element, dataSelector, filterData) {
    if ($(Element).data(dataSelector) !== filterData && filterData != '') {
      $(Element).addClass('fade');
    }
  },

  fadeElementInRange: function(Element, dataSelector, lowerBound, upperBound) {
    if ($(Element).data(dataSelector) < lowerBound || $(Element).data(dataSelector) > upperBound) {
      $(Element).addClass('fade');
    }
  }
};

$(function() {
  $('#lease-type').change(filters.filterLeaseType);
  $('#price').change(filters.filterPrice);
  $('#square-feet').change(filters.filterSquareFeet);
  $('#apply-filters').click(filters.applyFilters);

  $('#price').slider({
    range: true,
    min: 0,
    max: 10000,
    values: [0, 10000],
    slide: function(event, ui) {
      filters.filterPrice(ui.values[0], ui.values[1]);
      $('#price-title').text("Rent: " + ui.values[0] + " - " + ui.values[1] + " sq feet");
    }
  });
});
