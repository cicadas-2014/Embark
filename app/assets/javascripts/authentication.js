var loginForm = "<form method='post' action='/users/login'><input name='authenticity_token' type='hidden' value='muFKWZ/nJiE4Ud4AscCadtka+ZyRDxuEV22WZw3/lBM='><p><input type='text' name='email' placeholder= 'Email'></p><p><input type='password' name='password'></p><p class='submit'><input type='submit' value='Login to your account'></p></form>";
var signupForm = "<form method='post' action='/users'><input name='authenticity_token' type='hidden' value='muFKWZ/nJiE4Ud4AscCadtka+ZyRDxuEV22WZw3/lBM='><p><input type='text' name='email' placeholder= 'Email'></p><p><input type='password' name='password'></p><p class='submit'><input type='submit' value='Create Account'></p></form>";
var addAdventureForm = "<div id='adventureForm'><h1>NEW ADVENTURE</h1><form method='post' action='/users/addAdventure'><p>Adventure Name: </p><input type='text' name='title'><p>Categories: </p><input type='text' name='categories'><p>Duration: </p><input type='text' name='duration'><div id='descriptionBox'><p>Description: </p><textarea wrap='hard' name='description'></textarea></div><p>Start City: </p><input type='text' name='start_city'><p>Image URL: </p><input type='text' name='image_url'><p class='submit'><input type='submit' value='Create'></p></form></div>";

var speed = 600
var hideForms = function() {
  // $('#addAdventure').hide();
  $('#signupform').hide();
  $('#loginform').hide();
  $('#back').hide();
}

var showLoginForm = function(e) {
  e.preventDefault();
  $('#signupform').fadeTo(speed,0);
  $('#loginform').fadeTo(speed,1);
  $('#back').fadeTo(speed,0.7);
  setTimeout(function() {
    $('#signupform').hide();
  },speed)
}
var showSignupForm = function(e) {
  e.preventDefault();
  $('#back').fadeTo(speed,0.7);
  $('#signupform').fadeTo(speed,1);
  $('#loginform').fadeTo(speed,0);
    setTimeout(function() {
    $('#loginform').hide();
  },speed/2)
}

var appendAddAdventureForm = function(e){
  e.preventDefault();
  $('#adventureForm').append(addAdventureForm);
  $('#addAdventure').fadeTo(speed,0);
}
var fadeOutForms = function(){
  $('#signupform').fadeTo(speed,0);
  $('#loginform').fadeTo(speed,0);
}

var fadeOutLogin = function(){
  $('#loginform').fadeTo(speed,0);
}

var removeBack = function(e){
  e.preventDefault();
  $('#loginform').fadeTo(speed,0);
  $('#signupform').fadeTo(speed,0);
  $('#back').fadeTo(speed,0);
  setTimeout(function() {
    hideForms();
  },speed)
}
var stopPropagation = function(event){
  event.stopPropagation();
}

var ready = function(){
  hideForms();
  $('body').on('click', '#addAdventure', appendAddAdventureForm);
  
  $('body').on('click', '#loginNavBar', showLoginForm);
  $('body').on('click', '#loginButton', showLoginForm);
  $('body').on('click', '#signupNavBar', showSignupForm);
  $('body').on('click', '#signupButton', showSignupForm);

  $('body').on('click', '#backButton', removeBack);
  $('body').on('click', '#back', removeBack);
  
  $('body').on('click', '#img', stopPropagation);
  // $('body').on('click', '#loginform', stopPropagation);
  // $('body').on('click', '#signupform', stopPropagation);
}

$(document).ready(ready)
// $(document).on('page:load', ready());
