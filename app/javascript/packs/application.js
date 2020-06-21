// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import "bootstrap"
global.$ = jQuery;

import Rails from "@rails/ujs";
window.Rails = Rails;
// Rails.start();



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
// import { letters } from '../packs/letters'

import { masonry } from '../packs/masonry'
// import { packery } from '../packs/packery'
import { masonry2 } from '../packs/masonry2'
import { shot } from '../packs/shot'
import { drop } from '../packs/drop'
// import { search } from '../packs/search.js.erb'

$(document).ready(function() {

  var clickOnPopupLink = function(){
    $('body').on('click', '.static-popup-link', function(){
      $('#exampleModal').modal('show');
    });
  }

  clickOnPopupLink();

});

var checkBoxes = document.querySelectorAll(".tag-new .form-check-input");
var form = document.querySelector('.tag-new form');

for (const check of checkBoxes) {
  check.addEventListener( 'change', function() {
    Rails.fire(form, 'submit');
  });
}


form.addEventListener('ajax:success', () => {
  var elem = document.querySelector('.grid');

  imagesLoaded( elem ).on( 'progress', function() {
  masonry.reloadItems();
  masonry.layout();
  });
})
