const dropdown = document.querySelector("#dropdownMenuLink")
const dropdownlg = document.querySelector("#myDropdown")
const arrow = document.querySelector("#carrot")
const label = document.querySelectorAll(".form-check-label")
const drop = document.querySelectorAll(".dropped")
console.log(drop)
const check = document.querySelectorAll(".form-check-input")


if (drop) {
drop.forEach(function(d) {
    d.addEventListener("change", function() {
    d.classList.toggle("bold")
  })
})
}


if (dropdown) {
  dropdown.addEventListener("click", function() {
    dropdown.classList.toggle("bold")
    arrow.classList.toggle("animate__heartBeat")
    arrow.classList.toggle("drop")
  })
}



$('#myDropdown').on('hide.bs.dropdown', function () {
    dropdown.classList.remove("bold")
    arrow.classList.remove("animate__heartBeat")
    arrow.classList.remove("drop")
});
