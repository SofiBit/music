$(document).on('turbolinks:load', function() {
  $('[data-channel-subscribe="room"]').each(function(index, element) {
    var $element = $(element),
        room_id = $element.data('room-id')
        messageTemplate = $('[data-role="message-template"]');

    $element.animate({ scrollTop: $element.prop("scrollHeight")}, 0)

    App.cable.subscriptions.create(
      {
        channel: "RoomChannel",
        room: room_id
      },
      {
        received: function(data) {
          let content = messageTemplate.children().clone(true, true);
          content.find('[data-role="name"]').text(data.user_name);
          content.find('[data-role="avatar"]').attr("src", `${data.avatar.url}`);
          content.find('[data-role="message-text"]').html(data.message);
          content.find('[data-role="message-date"]').text(data.updated_at);
          $element.append(content);
          $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000);
        }
      }
    );
  });
});
