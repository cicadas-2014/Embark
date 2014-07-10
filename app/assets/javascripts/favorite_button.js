var alterFavoriteButton = function(e) {
  e.preventDefault();
  var data = $('#favorite_button').attr('adventure');
  document.getElementById('favorite_button').value = 'Saved to favorites!!'
  document.getElementById('favorite_button').adventure = 'nil'
  
  $.ajax({
    url: "/users/favorites",
    data: {'adventureID': data}
  })
}



$(document).ready(function() {
  $('body').on('click', '#favorite_button', alterFavoriteButton);
})