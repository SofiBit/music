function clickOnTag(name) {
  console.log('fd');
  let search = document.getElementById("main-search");
  let searchButton = document.getElementById("search-button");
  search.value = name;
  searchButton.click();
}
