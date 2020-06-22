const dropdown = document.querySelector("#dropdownMenuLink")
const dropdownlg = document.querySelector("#myDropdown")
const arrow = document.querySelector("#carrot")
const label = document.querySelectorAll(".form-check-label")
const drop = document.querySelectorAll(".dropped")
const check = document.querySelectorAll(".form-check-input")
const number = document.querySelector("#dropdownMenuLink span")


dropdownlg.addEventListener("click", function() {
  arrow.classList.add("animate__heartBeat")
  arrow.classList.add("drop")
  dropdown.classList.add("bold")
})




if (drop) {
drop.forEach(function(d) {
    d.addEventListener("change", function(event) {
    d.classList.toggle("bold")
    const isChecked = document.querySelectorAll('input[type="checkbox"]:checked').length;
    if (isChecked > 0) {
      console.log(isChecked)
      number.classList.add("num-show")
      dropdown.classList.add("bold")
    }
    else if (isChecked === 0) {
      number.classList.remove("num-show")
      dropdown.classList.remove("bold")
      arrow.classList.remove("animate__heartBeat")
      arrow.classList.remove("drop")
    }
  })
})
}


$('#myDropdown').on('hide.bs.dropdown', function () {
    //dropdown.classList.remove("bold")
    arrow.classList.remove("animate__heartBeat")
    arrow.classList.remove("drop")
});
