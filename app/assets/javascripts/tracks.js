function stashTrack(adding_track) {
  $.ajax({
    url: `https://music-connects.herokuapp.com/adding_tracks/${adding_track}.json`,
    type: 'patch',
    data: `adding_track[private]=true`,
    success: function(response) {
       if(response.status == 'success') {
         createButtonForTrack(adding_track, 'Reveal Track');
       }
    }
  });
}

function revealTrack(adding_track) {
  $.ajax({
    url: `https://music-connects.herokuapp.com/adding_tracks/${adding_track}.json`,
    type: 'patch',
    data: `adding_track[private]=false`,
    success: function(response) {
       if(response.status == 'success') {
         createButtonForTrack(adding_track, 'Stash Track');
       }
    }
  });
}

function createButtonForTrack(adding_track, make ) {
  let divButton = document.getElementById('button-public-private-track');
  divButton.innerHTML = '';
  let button = document.createElement('button');
  let text = document.createTextNode(make);
  button.appendChild(text);
  if(make == 'Reveal Track'){
    button.addEventListener("click", () => revealTrack(adding_track));
  }else {
    button.addEventListener("click", () => stashTrack(adding_track));
  }
  divButton.appendChild(button);
}
