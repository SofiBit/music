$(document).ready ->
  $(".ajax_form").on("ajax:success", (event) ->
    [data, status, xhr] = event.detail
    $("#show_div").append xhr.responseText
   ).on "ajax:error", (event) ->
    $("#show_div").append "<p>ERROR</p>"
