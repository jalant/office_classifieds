function renter_broker_signup(){
  $('.success').addClass('hidden');
  $('.alert').addClass('hidden');
  $('.signup').fadeIn(1000);
}

function renter_broker_login(){
  $('.success').addClass('hidden');
  $('.alert').addClass('hidden');
  $('.login').fadeIn(1000);
}

function signup_action(){
  $('.signup').addClass('hidden');
   $('.success').addClass('hidden');
  $('.alert').addClass('hidden');
}

$(function(){
  $('.right').on('click', '.success', renter_broker_signup);
  $('.right').on('click', '.alert', renter_broker_login);
  $('.right').on('click', '.signup', signup_action);
  
});