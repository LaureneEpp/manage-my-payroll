const arrow = document.querySelector("#arrow-allowances");
const subAllowances = document.querySelector("#sub-allowances");
const subDeductions = document.querySelector("#sub-deductions");

// Function dropdown for subMenuAllowances
function dropdown() {
    subAllowances.classList.toggle("hidden");
    arrow.classList.toggle("rotate-180");
    console.log('Test to dropdown menu')
}
  
arrow.addEventListener('click', dropdown);
