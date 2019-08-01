function copy(id) {

  var copyLink = document.getElementById(id);

  copyLink.select();

  document.execCommand("copy");

  alert("Copied the link: " + copyLink.value);
}
