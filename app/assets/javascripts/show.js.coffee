$ ->
  $('.ajax_form').on 'ajax:success', (e, data, status, xhr) ->
    $('#show_div').append data
    console.log data

  # $('.ajax_form').on 'ajax:error', (e, data, status, error) ->
  #   console.log e
  #   console.log data
  #   console.log status
  #   console.log xhr
