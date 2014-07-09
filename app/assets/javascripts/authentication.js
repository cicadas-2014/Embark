var loginForm = "<form method='post' action='/users/login'><input name='authenticity_token' type='hidden' value='muFKWZ/nJiE4Ud4AscCadtka+ZyRDxuEV22WZw3/lBM='><p><input type='text' name='email' placeholder= 'Email'></p><p><input type='password' name='password'></p><p class='submit'><input type='submit' value='Login to your account'></p></form>";
var signupForm = "<form method='post' action='/users'><input name='authenticity_token' type='hidden' value='muFKWZ/nJiE4Ud4AscCadtka+ZyRDxuEV22WZw3/lBM='><p><input type='text' name='email' placeholder= 'Email'></p><p><input type='password' name='password'></p><p class='submit'><input type='submit' value='Create Account'></p></form>";
var addAdventureForm = "<div id='adventureForm'><h1>NEW ADVENTURE</h1><form method='post' action='/users/addAdventure'><p>Adventure Name: <input type='text' name='title'></p><p>Categories: <input type='text' name='categories'></p><p>Duration: <input type='text' name='duration'></p><div id='descriptionBox'><p>Description: <textarea wrap='hard' name='description'></textarea></p></div><p>Start City: <input type='text' name='start_city'></p><p>Image URL: <input type='text' name='image_url'></p><p class='submit'><input type='submit' value='Create'></p></form></div>";
var hideForms = function() {
  $('#addAdventure').hide();
  $('div#signupform').hide();
  // $('div#loginform').hide();
  $('#back').hide();
}

var showLoginForm = function(e) {
  e.preventDefault();
  fadeOutForms();
  $('#loginform').fadeTo(1000,1);
  $('#back').fadeTo(1000,0.7);
}

var showSignupForm = function(e) {
  e.preventDefault();
  $('#loginform').fadeTo(600,0);
  $('#signupform').fadeTo(1000,1);
  $('#back').fadeTo(1000,0.7);
}

var appendAddAdventureForm = function(e){
  e.preventDefault();
  // fadeOutForms();
  $('#adventureForm').append(addAdventureForm);
}

var fadeOutForms = function(){
  $('#loginform').fadeTo(600,0);
  $('#back').fadeTo(600,0);
}

var loginForm = function(event){
  event.stopPropagation()
}

$(document).ready(function() {
  hideForms();
  $('body').on('click', '#login', showLoginForm);
  $('body').on('click', '#backButton', fadeOutForms);
  $('body').on('click', '#signup', showSignupForm);
  $('body').on('click', '#addAdventure', appendAddAdventureForm);
  $('body').on('click', '#loginform', loginForm);
})