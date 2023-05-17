// get all the links
const arrow = document.querySelector("#arrow")
const close_icon = document.querySelector('#close-icon')
const main_container = document.querySelector("main")
const menu_icon = document.querySelector('.menu-icon')
const sideMenu = document.querySelector('.sidebar')
const subMenu = document.querySelector("#submenu")
var w = document.documentElement.clientWidth || window.innerWidth;


function dropdown() {
  subMenu.classList.toggle("hidden");
  arrow.classList.toggle("rotate-0");
  }
  dropdown();

function openSidebar() {
  sideMenu.classList.toggle("hidden");
  if  ((!sideMenu.classList.contains('hidden')) && (w >= 1023)){
    main_container.style.marginLeft = "25%"
    sideMenu.classList.add("w-1/4")
    sideMenu.classList.add("block")
    console.log('Test01 for Sidebar')
  }
  if  (w <= 768){
    main_container.style.removeProperty("marginLeft");
    sideMenu.classList.remove("w-1/4")
    sideMenu.classList.remove("block")
    console.log('Test02 for Sidebar')
  }
}
openSidebar();
  
close_icon.addEventListener('click', openSidebar);
menu_icon.addEventListener('click', openSidebar);
arrow.addEventListener('click', dropdown)
