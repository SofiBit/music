function makePrivate(playlist_id) {
  $.ajax({
    url: `http://localhost:3000/playlists/${playlist_id}.json`,
    type: 'patch',
    data: `playlist[private]=true`,
    success: function(response) {
       if(response.status == 'success') {
         createButton(playlist_id, 'Make public');
       }
    }
  });
}

function createButton(playlist_id, make) {
  let divButton = document.getElementById('button-public-private-playlist');
  divButton.innerHTML = '';
  let buttonPublic = document.createElement('button');
  let text = document.createTextNode(make);
  buttonPublic.appendChild(text);
  if(make == 'Make public'){
    buttonPublic.addEventListener("click", () => makePublic(playlist_id));
  }else {
    buttonPublic.addEventListener("click", () => makePrivate(playlist_id));
  }
  divButton.appendChild(buttonPublic);
}

function makePublic(playlist_id) {
  $.ajax({
    url: `http://localhost:3000/playlists/${playlist_id}.json`,
    type: 'patch',
    data: `playlist[private]=false`,
    success: function(response) {
       if(response.status == 'success') {
         createButton(playlist_id, 'Make private');
       }
    }
  });
}
