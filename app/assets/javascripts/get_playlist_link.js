function getPlaylistLink() {
  let dummy = document.createElement('input'),
  text = window.location.href;
  document.body.appendChild(dummy);
  dummy.value = text;
  dummy.select();
  document.execCommand('copy');
  document.body.removeChild(dummy);

  showMessage("Copied the link");
}
