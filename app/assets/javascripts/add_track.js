function addTrack(user_id, track) {
  $.ajax({
    url: 'http://localhost:3000/adding_track_to_users.json',
    type: 'post',
    data: `track=${track}`,
    success: function(response) {
       if(response.status == 'ok') {
         getPlaylists(user_id, track);
       } else {
         alert(response.message)
       }
    }
  });
}

function getPlaylists(user_id, track){
  fetch(`http://localhost:3000/users/${user_id}/playlists.json`)
  .then(response => response.json())
  .then(commits => createList(commits, track));
}

function createList(data, track) {
  let modalContent = document.getElementById("modal-body");
  modalContent.innerHTML = "";

  for (let i = 0; i < data.length; i++) {
    let playlist = document.createElement('div');
    playlist.className = "select-playlist";
    playlist.id = data[i].id;
    playlist.innerHTML = data[i].title;
    playlist.addEventListener("click", () => addPlaylist(track, data[i].id));
    modalContent.appendChild(playlist);
  }
  createInput(track);
}

function createInput(track) {
  let modalFooter = document.getElementById('modal-footer');
  modalFooter.innerHTML = "";

  let newPlaylist = document.createElement('input');
  newPlaylist.setAttribute("type", "text");
  newPlaylist.className = "form-control"
  newPlaylist.id = 'playlist-title'
  newPlaylist.setAttribute("placeholder", "Create new playlist!");
  let send = document.createElement("BUTTON");
  send.className = "btn btn-outline-secondary";
  let text = document.createTextNode("Send");
  send.appendChild(text);
  send.addEventListener("click", () => createPlaylist(track));
  modalFooter.appendChild(newPlaylist);
  modalFooter.appendChild(send);
  $('#myModal').modal({show: true});
}

function createPlaylist(track) {
  let title = document.getElementById("playlist-title").value
  $.ajax({
    url: 'http://localhost:3000/playlists.json',
    type: 'post',
    data: `playlist[title]=${title}`,
    success: function(response) {
      let playlistId = response.id;
      let modalContent = document.getElementById("modal-body");
      let playlist = document.createElement('div');
      playlist.className = "select-playlist";
      playlist.id = playlistId;
      playlist.innerHTML = response.title;
      modalContent.appendChild(playlist);
      addPlaylist(track, playlistId);
    }
  })
}

function addPlaylist(track, playlist) {
  $.ajax({
    url: 'http://localhost:3000/adding_tracks.json',
    type: 'post',
    data: `track=${track}&playlist=${playlist}`,
    success: function(response) {
      document.getElementById(playlist).style.color = 'green';
      alert(response.message);
    }
  });
}
