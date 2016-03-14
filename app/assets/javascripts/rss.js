$(document).on('ready page:load', function() {
  $('body').on('click', '.add-favorites', function() {
    var link = $(this)
    $.ajax({
      url: '/users/favorites',
      data: {article_id: link.data('id')},
      type: 'post',
      success: function(data) {
        if (data.in_favorites) {
          link.html('remove from favorites')
        } else {
          link.html('add to favorites')
        }
      }
    });
  });
});