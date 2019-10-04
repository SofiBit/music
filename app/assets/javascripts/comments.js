function newComment(objectId, objectType) {
  $.ajax({
      url: `http://localhost:3000/comments/new.json`,
      type: 'get',
      data: `object_id=${objectId}&object_type=${objectType}`,
      success: function(response) {
        createForm(response);
      }
    });
}

function createForm(response) {
  console.log(response);
  let divReply = document.getElementById('reply-on-comment');
  divReply.innerHTML = '';
  let comments = document.getElementById('new-comment-' + response.object_id);
  let newComment = document.createElement('textarea');
  newComment.id = 'textarea-new-comment';
  newComment.className = 'textarea-new-comment';
  newComment.setAttribute("placeholder", "Create new comment!");
  let send = document.createElement("BUTTON");
  send.className = "";
  let text = document.createTextNode("Send");
  send.appendChild(text);
  send.addEventListener("click", () => createComment(response, newComment));
  comments.appendChild(newComment);
  comments.appendChild(send);
}

function createComment(responseFromNew, newComment){
  let body = newComment.value
  $.ajax({
    url: `http://localhost:3000/comments.json`,
    type: 'post',
    data: { comment: {body: body, user_id: responseFromNew.user_id, object_type: responseFromNew.object_type, object_id: responseFromNew.object_id} },
    success: function(response) {
      if(response.status == 'success') {
        showComment(response);
      } else {
        alert(response.message.body)
      }
    }
  });
}

function showComment(response) {
  let comments = document.getElementById('comments-on-comment-' + response.object_id);
  let comment = document.createElement('div');
  comment.className = 'comment';
  comment.innerHTML = response.user_first_name + ' ' + response.user_last_name + ':' + response.body;
  let line = document.createElement('hr');
  comment.appendChild(line);
  comments.appendChild(comment);
}



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
