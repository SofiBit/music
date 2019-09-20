function getPlaylists(user_id, track){
  fetch(`http://localhost:3000/users/${user_id}/playlists.json`)
  .then(response => response.json())
  .then(commits => create(commits, track));
}

function create (data, track) {
  for (let i = 0; i < data.length; i++) {
    let div = document.createElement('div');
    div.className = "select-playlist";
    div.innerHTML = data[i].title;
    div.addEventListener("click", () => addPlaylist(track, data[i].id));
    document.body.append(div);
  }
}

function addPlaylist(track, playlist) {
  $.ajax({
    url: 'http://localhost:3000/adding_tracks.json',
    type: 'post',
    data: `track=${track}&playlist=${playlist}`
  });
}
