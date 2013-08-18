var viewings = {
  display_viewings: function (e) {
    e.preventDefault();
    var listing_id = $(this).data('id');
    var params = {
      office_listing_id: listing_id
    };
    $.ajax({
      type: 'GET',
      url: '/office_listings/' + listing_id + '/viewings',
      data: params,
      dataType: 'script'
    });
  },
  add_viewing_to_favorite: function(e){
    e.preventDefault();
    var viewing_id = $(this).data('id');
    console.log(viewing_id);
    var params = {
      viewing_id: viewing_id
    };
    $.ajax({
      type: 'POST',
      url: '/renters/' + viewing_id + '/appointments',
      data: params,
      dataType: 'script'
    });
    $(this).removeClass("button").removeClass("showing").addClass("added").fadeIn(500);
    $(this).text("Appointment scheduled with broker (Please view your itenary for details)");
  }
}

$(function() {
  $('.showing').on('click', viewings.display_viewings);
  $('.viewings-dates').on('click', '.individual-viewing', viewings.add_viewing_to_favorite);
})
