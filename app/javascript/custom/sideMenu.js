// get all the links
const arrow = document.querySelector("#arrow");
const bookmark_icon = document.querySelector('#bookmark-icon');
const close_icon = document.querySelector('#close-icon');
const main_container = document.querySelector(".main-container");
const menu_icon = document.querySelector('.menu-icon');
const sideMenu = document.querySelector('.sidebar');
const subMenu = document.querySelector("#submenu");
var isScrolling;
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
  sideMenu.classList.remove('translate-x-[-100%]');
  console.log('Test to open modal')
}

// Function to close SidebarMenu
function closeSidebarMenu() {
  sideMenu.classList.add('translate-x-[-100%]');
  main_container.style.marginLeft = '';
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
    console.log('Test for toggleFixedMenu');
  } else {
    main_container.classList.toggle('ml-0');
    main_container.style.marginLeft = '';
  }
}


// Afficher le bouton dans l'angle supérieur gauche
function showButton() {
  menu_icon.classList.remove('hidden');
}

// Masquer le bouton dans l'angle supérieur gauche
function hideButton() {
  menu_icon.classList.add('hidden');
}

// Événement de scroll du conteneur de contenu
main_container.addEventListener('scroll', function () {
  console.log('scrolling...')
  // clearTimeout(isScrolling);
  // hideButton();
})

  // Déterminer si le scroll est arrêté après 200 millisecondes
//   isScrolling = setTimeout(function() {
//     showButton();
//   }, 200);
// });

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
