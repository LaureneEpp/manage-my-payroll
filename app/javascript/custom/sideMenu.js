// get all the links
const arrow = document.querySelector("#arrow");
const bookmark_icon = document.querySelector('#bookmark-icon');
const close_icon = document.querySelector('#close-icon');
const main_container = document.querySelector(".main-container");
const menu_icon = document.querySelector('.menu-icon');
const sideMenu = document.querySelector('.sidebar');
const subMenu = document.querySelector("#submenu");
// var isScrolling;
// var w = document.documentElement.clientWidth || window.innerWidth;

// Function hideMenuIcon
// menu_icon.addEventListener('mouseenter', function() {
//   menu_icon.style.display = 'none';
// });

// document.addEventListener('mousemove', function(event) {
//   var mouseX = event.clientX;
//   var mouseY = event.clientY;
//   if (mouseX <= 40 && mouseY <= 40) {
//     menu_icon.style.display = 'block';
//   } else {
//     menu_icon.style.display = 'none';
//   }
// });


// Function to open SidebarMenu
function openSidebarMenu() {
  sideMenu.classList.toggle('translate-x-[-100%]');
  console.log('Test to open modal')
}

// Function to close SidebarMenu
function closeSidebarMenu() {
  sideMenu.classList.toggle('translate-x-[-100%]');
  main_container.style.marginLeft = '';
  bookmark_icon.style.fill = 'none';
  console.log('Test to close modal')
}
// Function dropdown for subMenu
function dropdown() {
  subMenu.classList.toggle("hidden");
  arrow.classList.toggle("rotate-0");
  console.log('Test to dropdown menu')
}

// Function toggle fixed menu
function toggleFixedMenu() {
  if (!sideMenu.classList.contains('translate-x-[-100%]')) {
    main_container.classList.toggle('ml-0');
    main_container.style.marginLeft = "300px";
    bookmark_icon.style.fill = 'red';
    console.log('Test for toggleFixedMenu');

  } else {
    main_container.classList.toggle('ml-0');
    main_container.style.marginLeft = '';
  }
}

// Make menu Icon appears
// window.addEventListener('mousemove', hideShowMenuIcon)

// Open menu when click on menu icon
menu_icon.addEventListener('click', () => {
  sideMenu.classList.contains('translate-x-[-100%]')? openSidebarMenu(): closeSidebarMenu();
  console.log('Test menu icon');
});
// Close menu when click on close icon
close_icon.addEventListener('click', closeSidebarMenu);

// Toggle fixed menu on bookmark icon
bookmark_icon.addEventListener('click', toggleFixedMenu);

// Toggle fixed menu on bookmark icon
arrow.addEventListener('click', dropdown);
