function copy(id) {
  let copyLink = document.getElementById(id);
  copyLink.select();
  document.execCommand("copy");
  showMessage("Copied the link: " + copyLink.value);
}
