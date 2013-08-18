var showings = {
  display_broker_showing_form: function(e) {
    e.preventDefault();
    $(".success_div").remove();
    var office_listing_id = $(this).data('id');
    var hello_tanay = $('<div>');
    $('.test-box').remove();
    hello_tanay.addClass('test-box hidden');
    hello_tanay.append(office_listing_id);
    $('#showings-box').append(hello_tanay);
    var params = {
      office_listing_id: office_listing_id
    };
    $.ajax({
      type: 'GET',
      url: '/office_listings/' + office_listing_id + '/viewings/new',
      data: params,
      dataType: 'script'
    });
  },

  make_new_viewing: function(e) {
    e.preventDefault();

    var office_listing_id = $('.test-box').html();
    var date = $('#datepicker').val();
    var start_time = $('#startTime').val();
    var end_time = $('#endTime').val();
    var params = {
      office_listing_id: office_listing_id,
      date: date,
      start_time: start_time,
      end_time: end_time
    };
    $.ajax({
      type: 'POST',
      url: '/office_listings/' + office_listing_id + '/viewings',
      data: params,
      dataType: 'script',
      success: function(){
        var successDiv = $("<div> Showing event created! <div>");
        successDiv.addClass('success_div');
        $("#showings-box").prepend(successDiv);
        $('input').val("");
      }
    });
  }
}

$(function() {
  $('#datepicker').datepicker({
    format: 'dd-mm-yyyy'
  });

  $('#startTime').timepicker({
    'minTime': '9:00am',
    'maxTime': '6:00pm'
  });

  $('#endTime').timepicker({
    'minTime': '9:00am',
    'maxTime': '6:00pm'
  });

  $('.broker-showing-form').on('click', showings.display_broker_showing_form);
  $('#make-new-viewing').on('click', showings.make_new_viewing);

})
