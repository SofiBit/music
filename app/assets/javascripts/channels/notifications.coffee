App.notifications = App.cable.subscriptions.create "NotificationsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (notification) ->
    # Called when there's incoming data on the websocket for this channel
    $('#notifications').prepend "#{notification.message}"
    quantityNotifications = parseInt(localStorage.getItem('notice'))
    if quantityNotifications
      quantityNotifications++
      localStorage.setItem 'notice', quantityNotifications
    else
      localStorage.setItem 'notice', 1
      quantityNotifications = 1
    $('#img_bell').attr("src", "https://img.icons8.com/plasticine/100/000000/appointment-reminders.png")
    $('#quantity-notice').html "#{quantityNotifications}"
