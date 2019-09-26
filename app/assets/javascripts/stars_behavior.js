function starsBehavior(stars) {
  let rating = document.querySelector('.rating');
  let ratingItem = document.querySelectorAll('.rating-item');

  if(stars > 0) {
    for(let i = 0; i < ratingItem.length; i ++) {
      if(ratingItem[i].getAttribute('data-rate') == stars) {
        ratingItem[i].classList.add('active', 'current-active');
        mouseOverActiveClass(ratingItem);
        break;
      }
    }
  }

  rating.onclick = function(event){
    let target = event.target;
    if(target.classList.contains('rating-item')) {
      removeClass(ratingItem, 'current-active');
      target.classList.add('active', 'current-active');
    }
  }

  rating.onmouseover = function(event) {
    let target = event.target;
    if(target.classList.contains('rating-item')) {
      removeClass(ratingItem, 'active');
      target.classList.add('active');
      mouseOverActiveClass(ratingItem);
    }
  }

  rating.onmouseout = function(event) {
    addClass(ratingItem, 'active');
    mouseOutActiveClass(ratingItem);
  }

  function removeClass(arr) {
    for(let i = 0, iLen = arr.length; i < iLen; i ++) {
      for(let j = 1; j < arguments.length; j ++) {
        ratingItem[i].classList.remove(arguments[j]);
      }
    }
  }

  function addClass(arr) {
    for(let i = 0, iLen = arr.length; i < iLen; i ++) {
      for(let j = 1; j < arguments.length; j ++) {
        ratingItem[i].classList.add(arguments[j]);
      }
    }
  }

  function mouseOverActiveClass(arr){
    for(let i = 0, iLen = arr.length; i < iLen; i ++) {
      if(arr[i].classList.contains('active')) {
        break;
      } else {
        arr[i].classList.add('active');
      }
    }
  }

  function mouseOutActiveClass(arr){
    for(let i = arr.length - 1; i >= 1; i --) {
      if(arr[i].classList.contains('current-active')) {
        break;
      } else {
        arr[i].classList.remove('active');
      }
    }
  }
}
