function textarea() {
  $('#comment-form').on( 'change keydown keyup paste cut', 'textarea', function () {
    $(this).height(0).height(this.scrollHeight+2);
    if ($(this).height() >= 100) {
      $('textarea#txtarea').css("overflow", "auto");
    }
    else {
      $('textarea#txtarea').css("overflow", "hidden");
    }
  }).find('textarea#txtarea').change();
}
