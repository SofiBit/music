// function createAll(playlist_id, user_id) {
//   getComments(playlist_id);
//   createField(playlist_id, user_id);
// }
//
// function getComments(playlist_id) {
//   $.ajax({
//     url: `http://localhost:3000/comments.json`,
//     type: 'get',
//     data: `object=${playlist_id}`,
//     success: function(response) {
//       createComments(response);
//     }
//   });
// }
//
// function createComments(response) {
//   let comments = document.getElementById('comments');
//   for (let i = 0; i < response.length; i++) {
//     let comment = document.createElement('div');
//     comment.className = "comment";
//     comment.id = response[i].id;
//     comment.innerHTML = response[i].user_first_name + ' ' + response[i].user_last_name + ':' + response[i].body;
//     let line = document.createElement('hr');
//     comment.appendChild(line);
//     comments.appendChild(comment);
//   }
// }
//
// function createField(playlist_id, user_id) {
//   let comments = document.getElementById('new-comment');
//   let newComment = document.createElement('textarea');
//   newComment.id = 'textarea-new-comment';
//   newComment.className = 'textarea-new-comment';
//   newComment.setAttribute("placeholder", "Create new comment!");
//   let send = document.createElement("BUTTON");
//   send.className = "";
//   let text = document.createTextNode("Send");
//   send.appendChild(text);
//   send.addEventListener("click", () => createComment(playlist_id, user_id, newComment));
//   comments.appendChild(newComment);
//   comments.appendChild(send);
// }
//
// function createComment(playlist_id, user_id, newComment){
//   let body = newComment.value
//   $.ajax({
//     url: `http://localhost:3000/comments.json`,
//     type: 'post',
//     data: { comment: {body: body, user_id: user_id, object_type: 'Playlist', object_id: playlist_id} },
//     success: function(response) {
//       if(response.status == 'success') {
//         showComment(response);
//       } else {
//         alert(response.message.body)
//       }
//     }
//   });
// }
//
// function showComment(response) {
//   let comments = document.getElementById('comments');
//   let comment = document.createElement('div');
//   comment.className = 'comment';
//   comment.innerHTML = response.user_first_name + ' ' + response.user_last_name + ':' + response.body;
//   let line = document.createElement('hr');
//   comment.appendChild(line);
//   comments.appendChild(comment);
// }

function textarea() {
  $('#comment-form').on( 'change keydown keyup paste cut', 'textarea', function () {
    $(this).height(0).height(this.scrollHeight+2);
    if ($(this).height() >= 100) {
      $('textarea#txtarea').css("overflow", "auto");
    }
    else {
      $('textarea#txtarea').css("overflow", "hidden");
    }
  }).find('textarea#txtarea').change();
}
