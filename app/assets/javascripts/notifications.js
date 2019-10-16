$(document).on('turbolinks:load', function() {
  let bell = localStorage.getItem('notice');
  let quantityNotifications = parseInt(bell);
  if(quantityNotifications > 0) {
    $('#img_bell').attr("src", "https://img.icons8.com/plasticine/100/000000/appointment-reminders.png")
    $('#quantity-notice').html(`${quantityNotifications}`)
  }
  $('#bell').on('click', writeNotice);
})

function writeNotice() {
  localStorage.setItem('notice', 0);
  $('#img_bell').attr("src", "https://img.icons8.com/carbon-copy/100/000000/appointment-reminders--v1.png")
  $('#quantity-notice').html('');
}
