App.notifications = App.cable.subscriptions.create "NotificationsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (notification) ->
    # Called when there's incoming data on the websocket for this channel
    $('#notifications').prepend "<div class='notification'>#{notification.message}</div>"
