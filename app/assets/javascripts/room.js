$(function() {
  $('#input-message').on('ajax:success', function(a, b, c ) {
    $(this).find('input[type="text"]').val('');
  });
});
