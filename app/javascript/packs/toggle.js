// $(function () {
//     var data = localStorage.getItem("theme");
//     if (data !== null) {
//         $("input[name='theme']").attr("checked", "checked");
//     }
// });

// $("input[name='theme']").click(function () {

//     if ($(this).is(":checked")) {
//         localStorage.setItem("theme", $(this).val());
//     } else {
//         localStorage.removeItem("theme");
//     }

// });
// const checkbox = document.querySelector('input[name=theme]');

// const toggle = () => {
//   if (checkbox) {
//   checkbox.addEventListener('change', function(event) {
//     (event.target.checked) ? document.documentElement.setAttribute('data-theme', 'dark') : document.documentElement.setAttribute('data-theme', 'light')
//   });
// }
// }

const checkbox = document.querySelector('input[name=theme]');
const toggle = () => {
  if (checkbox) {
  checkbox.addEventListener('change', function() {
      if(this.checked) {
          trans()
          document.documentElement.setAttribute('data-theme', 'dark')
      } else {
          trans()
          document.documentElement.setAttribute('data-theme', 'light')
      }
  })
  }
}

let trans = () => {
    document.documentElement.classList.add('transition');
    window.setTimeout(() => {
        document.documentElement.classList.remove('transition')
    }, 180)
}

toggle()


// document.addEventListener('turbolinks:load', () => {
// // var themeSwitch = document.getElementById('switch');
// if(checkbox) {
//   initTheme(); // on page load, if user has already selected a specific theme -> apply it

//   checkbox.addEventListener('change', function(event){
//     resetTheme(); // update color theme
//   });

//   function initTheme() {
//     var darkThemeSelected = (localStorage.getItem('switch') !== null && localStorage.getItem('switch') === 'dark');
//     // update checkbox
//     checkbox.checked = darkThemeSelected;
//     console.log(checkbox.checked)
//     // update body data-theme attribute
//     darkThemeSelected ? document.body.setAttribute('data-theme', 'dark') : document.body.setAttribute('data-theme', 'light')
//   };

//   function resetTheme() {
//     if(checkbox.checked) { // dark theme has been selected
//       document.body.setAttribute('data-theme', 'dark');
//       localStorage.setItem('switch', 'dark'); // save theme selection
//     } else {
//       document.body.setAttribute('data-theme', 'light')
//       localStorage.setItem('switch', 'light');
//     }
//   };
// }
// })

export default toggle
