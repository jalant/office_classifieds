var infowindow = null;

var office_map = {
  map: null,

  display_map: function(lat, lng) {
    var mapOptions = {
      center: new google.maps.LatLng(lat, lng),
      zoom: 15,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var canvas = $('#map-canvas')[0];
    office_map.map = new google.maps.Map(canvas, mapOptions);
  },

  add_marker: function(lat, lng, location) {
    var latlng = new google.maps.LatLng(lat, lng);
    var marker = new google.maps.Marker({
      position: latlng,
      map: office_map.map,
      icon: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png',
      title: location
    });
    office_map.attach_message(location, marker);
  },

  attach_message: function(location, marker) {
    google.maps.event.addListener(marker, 'click', function() {
      if (infowindow) {
        infowindow.close();
      };
      infowindow = new google.maps.InfoWindow();
      infowindow.setContent("<div class='special2'> <a class='map-label' href ='office_listings/" + $('.ind-offices:contains(' + location.split(',')[0] + ')').first().data('id') + "'> Address: </a> <br> </div>" +
        "<a class='map-label2' href ='office_listings/" + $('.ind-offices:contains(' + location.split(',')[0] + ')').first().data('id') + "'>" + location + "</a>");
      infowindow.open(office_map.map, marker);
    });
  }
};

var office_map2 = {
  map: null,

  display_map2: function(lat, lng) {
    var map_center = new google.maps.LatLng(lat, lng);
    console.log(lat);
    console.log(lng);
    var mapOptions = {
      center: map_center,
      zoom: 16,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var canvas = $('#map-canvas2')[0];
    office_map2.map = new google.maps.Map(canvas, mapOptions);

    var panoramaOptions = {
      position: map_center,
      pov: {
        heading: 34,
        pitch: 10
      }
    };
    var panorama = new google.maps.StreetViewPanorama(document.getElementById('pano'), panoramaOptions);
    office_map2.map.setStreetView(panorama);
  },

  add_marker2: function(lat, lng, location) {
    var latlng = new google.maps.LatLng(lat, lng);
    var marker = new google.maps.Marker({
      position: latlng,
      map: office_map.map,
      icon: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png',
      title: location
    });
  }
};

filters = {
  // stores current 'state' of filters as defined by user input
  filterData: {
    leaseType: '',
    priceUpper: 10000,
    priceLower: 0,
    squareFeetUpper: 10000,
    squareFeetLower: 0
  },

  filterLeaseType: function(e) {
    filters.filterData.leaseType = $(event.target).val();
  },

  filterPrice: function(priceLower, priceUpper) {
    filters.filterData.priceLower = priceLower;
    filters.filterData.priceUpper = priceUpper;
  },

  filterSquareFeet: function(squareFeetLower, squareFeetUpper) {
    filters.filterData.squareFeetLower = squareFeetLower;
    filters.filterData.squareFeetUpper = squareFeetUpper;
  },

  applyFilters: function() {
    $('.ind-offices').each(function(index, Element) {
      $(Element).removeClass('show');
      $(Element).removeClass('fade');
      filters.fadeElement(Element, 'lease-type', filters.filterData.leaseType);
      filters.fadeElementInRange(Element, 'square-feet', filters.filterData.squareFeetLower, filters.filterData.squareFeetUpper);
      filters.fadeElementInRange(Element, 'price', filters.filterData.priceLower, filters.filterData.priceUpper);
      if (!($(Element).hasClass('fade'))) {
        // Add show class if no fade elements applied in filter chain
        $(Element).addClass('show');
      }
    });
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

  $('#lease-type').change(function(e) {
    filters.filterLeaseType(e);
    filters.applyFilters();
  });

  $('#apply-filters').click(filters.applyFilters);

  $('#price').slider({
    range: true,
    min: 0,
    max: 10000,
    values: [0, 10000],
    slide: function(event, ui) {
      filters.filterPrice(ui.values[0], ui.values[1]);
      $('#price-title').text("Rent: $" + ui.values[0] + " - " + ui.values[1])
    },
    stop: function(event, ui) {
      filters.applyFilters();
    }
  });

  $('#square-feet').slider({
    range: true,
    min: 0,
    max: 10000,
    values: [0, 10000],
    slide: function(event, ui) {
      filters.filterSquareFeet(ui.values[0], ui.values[1]);
      $('#square-feet-title').text("Square Feet: " + ui.values[0] + " - " + ui.values[1] + " sq feet");
    },
    stop: function(event, ui) {
      filters.applyFilters();
    }
  });
});