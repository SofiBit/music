function openModal() {
  let modal = document.getElementById('openModal');
  modal.removeAttribute('hidden');
  setTimeout(stashModal, 2000);
}

function stashModal() {
  let modal = document.getElementById('openModal');
  modal.setAttribute('hidden', 'true');
}

function showMessage(message) {
  let modalBody = document.getElementById('pop_up_body');
  modalBody.innerHTML = '';
  modalBody.innerHTML = message;
  openModal();
}
