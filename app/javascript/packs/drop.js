const dropdown = document.querySelector("#dropdownMenuLink")
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
    arrow.classList.toggle("drop")
    dropdown.classList.toggle("bold")
  })
}
