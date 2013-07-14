function renter_broker_signup(e){
  e.preventDefault();
  $('.signup-div').addClass('hidden');
  $('.login-div').addClass('hidden');
  $('.signup').fadeIn(1000);
  $('.signup').addClass('bottom_signup');
}

function renter_broker_login(e){
  e.preventDefault();
  $('.signup-div').addClass('hidden');
  $('.login-div').addClass('hidden');
  $('.login').fadeIn(1000);
}

function signup_action(e){
  e.preventDefault();
  $('.signup-div').addClass('hidden');
  $('.login-div').addClass('hidden');
}

$(function(){
  $('.right').on('click', '.signup-div', renter_broker_signup);
  $('.right').on('click', '.login-div', renter_broker_login);
  $('.right').on('click', '.signup', signup_action);
  $('.signup-div').on('click', renter_broker_signup);
});