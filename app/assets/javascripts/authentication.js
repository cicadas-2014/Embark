var loginForm = "<form method='post' action='user#login'><p><input type='text' name='email' placeholder= 'Email'></p><p><input type='password' name='password' value='password'></p><p class='submit'><input type='submit' value='Submit'></p></form>";

var appendLoginForm = function(e) {
  e.preventDefault();
  $('#signup').hide();
  $('#login').hide();
  $('#new_session').append(loginForm);
}












$(document).ready(function() {
  $('body').on('click', '#login', appendLoginForm)

})