// Get all the links
const taxation_names = document.querySelectorAll('.taxation-name');
const buttons = document.querySelectorAll('.taxation-button');
// const array_buttons = Array.from(buttons);
const allowance_modals = document.querySelectorAll('.allowance-modal');

// if click on allowance name in side bar 
taxation_names.forEach(name => name.addEventListener('click', (e) => {
    const clickedButton = name.dataset.taxation;
    console.log(clickedButton);
      // Check if the clicked element has the data-btn attribute
  if (clickedButton) {
    // Remove active class from all buttons
    buttons.forEach(function(btn) {
      btn.classList.remove('active');
    });

    // Add active class to the target button
    const targetButton = document.querySelector('[data-box="' + clickedButton + '"]');
    targetButton.classList.add('active');
  }
} ))