// get all the links
const sideMenu = document.querySelector('.sidebar')
const menu_icon = document.querySelector('.menu-icon')
const close_icon = document.querySelector('#close-icon')
const subMenu = document.querySelector("#submenu")
 const arrow = document.querySelector("#arrow")

close_icon.addEventListener('click', openSidebar);
menu_icon.addEventListener('click', openSidebar);
arrow.addEventListener('click', dropdown)

function dropdown() {
    subMenu.classList.toggle("hidden");
    arrow.classList.toggle("rotate-0");
  }
  dropdown();

function openSidebar() {
    sideMenu.classList.toggle("hidden");
 }

console.log('Test for Sidebar')