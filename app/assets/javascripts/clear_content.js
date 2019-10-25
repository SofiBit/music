function clearContent() {
  let element = document.getElementById('show_div');
  let form = document.getElementById('search-track');
  form.value = "";
  element.innerHTML = "";
  returnContent(element);
}

function returnContent(element) {
  let instruction = document.createElement('p');
  instruction.className="input-instruction";
  instruction.innerHTML="Enter the link and receive the information about track";
  element.appendChild(instruction);
}
