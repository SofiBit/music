function previewFile() {
  let preview = document.querySelector('.preview');
  let file    = document.querySelector('input[type=file]').files[0];
  let reader  = new FileReader();

  reader.onloadend = function () {
    preview.style.backgroundImage = "url(" + reader.result + ")";
  }

  if (file) {
    reader.readAsDataURL(file);
  } else {
    preview.src = "";
  }
}
