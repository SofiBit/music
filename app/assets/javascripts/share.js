function shareEmail(url, result) {
  let link = `https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=&su=Links&body=Generated with ${url}%0A${result}'&ui=2&tf=1&pli=1`;
  window.open(link);
};

function shareTelegram(url, result) {
  let link = `https://telegram.me/share/url?url=Generated with ${url}&text=${result}`;
  window.open(link);
};
