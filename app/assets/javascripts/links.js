function copy(id) {
  let copyLink = document.getElementById(id);
  copyLink.select();
  document.execCommand("copy");
  alert("Copied the link: " + copyLink.value);
}
