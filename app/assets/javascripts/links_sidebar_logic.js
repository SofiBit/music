let selectedTd;

function clicked(event) {
  let target = event.target;
 console.log(target)
  if (target.id === 'a-sidebar-main-style' ) {
      highlight(target)
    };
};

function highlight(td) {
    console.log('afaf');
  if (selectedTd) { 
    selectedTd.classList.remove('a-sidebarClicked');
  }
  selectedTd = td;
  selectedTd.classList.remove('a-sidebar');
  selectedTd.classList.add('a-sidebarClicked');
  console.log(selectedTd)
}