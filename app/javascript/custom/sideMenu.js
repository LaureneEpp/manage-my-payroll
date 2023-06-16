// get all the links
const arrow = document.querySelector("#arrow")
const bookmark_icon = document.querySelector('#bookmark-icon')
const close_icon = document.querySelector('#close-icon')
const main_container = document.querySelector("main")
const menu_icon = document.querySelector('.menu-icon')
const sideMenu = document.querySelector('.sidebar')
const subMenu = document.querySelector("#submenu")
// var w = document.documentElement.clientWidth || window.innerWidth;

// Function to open SidebarMenu
function openSidebarMenu() {
  sideMenu.classList.add('translate-x-[-100%]');
}

// Function to close SidebarMenu
function closeSidebarMenu() {
  sideMenu.classList.add('translate-x-[-100%]');
  main_container.style.marginLeft = '';
}
// Function dropdown for subMenu
function dropdown() {
  subMenu.classList.toggle("hidden");
  arrow.classList.toggle("rotate-0");
}

// Function toggle fixed menu
function toggleFixedMenu() {
  if (!sideMenu.classList.contains('translate-x-[-100%]')) {
    main_container.classList.remove('ml-0');
    main_container.style.marginLeft = "300px";
    console.log('Test for toggleFixedMenu')
  } else {
    main_container.classList.add('ml-0');
    main_container.style.marginLeft = '';
  }
}

// Open menu when click on menu icon
menu_icon.addEventListener('click', () => {
  sideMenu.classList.contains('translate-x-[-100%]')? openSidebarMenu(): closeSidebarMenu();
  console.log('Test menu icon')
});
// Close menu when click on close icon
close_icon.addEventListener('click', closeSidebarMenu)

// Toggle fixed menu on bookmark icon
bookmark_icon.addEventListener('click', toggleFixedMenu)