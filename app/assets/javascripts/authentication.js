var loginForm = "<form method='post' action='user/login'><input name='authenticity_token' type='hidden' value='muFKWZ/nJiE4Ud4AscCadtka+ZyRDxuEV22WZw3/lBM='><p><input type='text' name='email' placeholder= 'Email'></p><p><input type='password' name='password'></p><p class='submit'><input type='submit' value='Login to your account'></p></form>";

var signupForm = "<form method='post' action='user/signup'><input name='authenticity_token' type='hidden' value='muFKWZ/nJiE4Ud4AscCadtka+ZyRDxuEV22WZw3/lBM='><p><input type='text' name='email' placeholder= 'Email'></p><p><input type='password' name='password'></p><p class='submit'><input type='submit' value='Create Account'></p></form>";

var hideButtons = function() {
  $('#signup').hide();
  $('#login').hide();
}

var appendLoginForm = function(e) {
  e.preventDefault();
  hideButtons();
  $('#new_session').append(loginForm);
}

var appendSignupForm = function(e) {
  e.preventDefault();
  hideButtons();
  $('#new_session').append(signupForm);
}










$(document).ready(function() {
  $('body').on('click', '#login', appendLoginForm);
  $('body').on('click', '#signup', appendSignupForm);
})