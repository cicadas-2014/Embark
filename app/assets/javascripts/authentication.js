var loginForm = "<form method='post' action='/users/login'><input name='authenticity_token' type='hidden' value='muFKWZ/nJiE4Ud4AscCadtka+ZyRDxuEV22WZw3/lBM='><p><input type='text' name='email' placeholder= 'Email'></p><p><input type='password' name='password'></p><p class='submit'><input type='submit' value='Login to your account'></p></form>";

var signupForm = "<form method='post' action='/users'><input name='authenticity_token' type='hidden' value='muFKWZ/nJiE4Ud4AscCadtka+ZyRDxuEV22WZw3/lBM='><p><input type='text' name='email' placeholder= 'Email'></p><p><input type='password' name='password'></p><p class='submit'><input type='submit' value='Create Account'></p></form>";

var addAdventureForm = "<div id='adentureForm'><h1>NEW ADVENTURE</h1><form method='post' action='/users/addAdventure'><p>Adventure Name: <input type='text' name='title'></p><p>Categories: <input type='text' name='categories'></p><p>Duration: <input type='text' name='duration'></p><div id='descriptionBox'><p>Description: <textarea wrap='hard' name='description'></textarea></p></div><p>Start City: <input type='text' name='start_city'></p><p>Image URL: <input type='text' name='image_url'></p><p class='submit'><input type='submit' value='Create'></p></form></div>";

var hideButtons = function() {
  $('#signup').hide();
  $('#login').hide();
  $('#addAdventure').hide();
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


var appendAddAdventureForm = function(e){
  e.preventDefault();
  hideButtons();
  $('#adventureForm').append(addAdventureForm);
}



$(document).ready(function() {
  $('body').on('click', '#login', appendLoginForm);
  $('body').on('click', '#signup', appendSignupForm);
  $('body').on('click', '#addAdventure', appendAddAdventureForm);
})