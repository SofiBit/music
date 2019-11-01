function getPlaylistLink() {
  let currentLocation = window.location.toString();
  document.execCommand("copy", false, currentLocation);
  alert("Copied the link: " + currentLocation);
}
