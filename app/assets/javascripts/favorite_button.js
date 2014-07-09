var alterFavoriteButton = function(e) {
  e.preventDefault();
  var data = { adventure: $('#favorite_button').attr('adventure') };
  console.log(data);
  document.getElementById('favorite_button').value = 'Saved to favorites!!'
  document.getElementById('favorite_button').adventure = 'nil'
  console.log(document.getElementById('favorite_button').value)
  $.ajax({
    url: "/users/favorites",
    data: data
  })
}



$(document).ready(function() {
  $('body').on('click', '#favorite_button', alterFavoriteButton);
})