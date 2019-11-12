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
    $('#img-bell').empty()
    $('#img-bell').append('<svg width="29" height="33" viewBox="0 0 29 33" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M21.6625 26.1081H2.33748C1.45767 26.1081 1.00665 25.0538 1.61424 24.4175L3.4465 22.4986C3.80177 22.1265 4 21.6319 4 21.1174V12.6216C4 8.20335 7.58172 4.62162 12 4.62162C16.4183 4.62162 20 8.20334 20 12.6216V21.1174C20 21.6319 20.1982 22.1265 20.5535 22.4986L22.3858 24.4175C22.9934 25.0538 22.5423 26.1081 21.6625 26.1081Z" fill="white" stroke="white"/><path d="M9.5 28.6757H14.5C13.388130.5989 10.6119 30.5989 9.5 28.6757Z" fill="white" stroke="white" stroke-width="1.5" stroke-linecap="round"/><circle cx="18.5" cy="10.5" r="10" fill="#D60404" stroke="#2B2525"/></svg>')
    $('#quantity-notice').html "#{quantityNotifications}"
