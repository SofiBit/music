function shareTelegram(url, result) {
  let link = `https://telegram.me/share/url?url=${url}&text=${result}`;
  window.open(link);
};

function shareEmail(result) {
  let link = `https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=&su=Your+Subject+here&body='+${result}+'&ui=2&tf=1&pli=1'`;
  window.open(link);
};
