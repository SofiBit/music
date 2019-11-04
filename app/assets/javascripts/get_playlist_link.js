function getPlaylistLink() {
  let currentLocation = window.location.toString();
  document.execCommand("copy", false, currentLocation);
  showMessage("Copied the link: " + currentLocation);
}
