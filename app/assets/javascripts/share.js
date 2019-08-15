function shareEmail(result) {
  // var r = result.
  let link = `https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=&su=Your+Subject+here&body='+${result}+'&ui=2&tf=1&pli=1'`;
  window.open(link);
};

function shareTelegram(result) {
  let link = `https://telegram.me/share/url?url=${transform(result}`;
  window.open(link);
};

function transform(result) {
    let string = ``;
    for (let key in result) {
      string += ` ${key}:  ${result[key]} \n
      ` ;
    }
    return string
}
