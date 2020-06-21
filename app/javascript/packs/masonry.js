var elem = document.querySelector('.grid');

if (elem) {
var masonry = new Masonry( elem, {
  itemSelector: '.grid-item',
  itemSelector: '.grid-item',
  columnWidth: '.grid-sizer',
  horizontalOrder: true,
  // "gutter": 20,
  // percentPosition: true,
  isFitWidth: true
});

function imageLoad() {
    imagesLoaded( elem ).on( 'progress', function() {
    // layout Masonry after each image loads
    masonry.layout();
    });
  }
 imageLoad()

 $(document).on('turbolinks:load', function() {
  imageLoad()
});
}






window.setTimeout(function() {
    imagesLoaded( elem ).on( 'progress', function() {
      // layout Masonry after each image loads
      masonry.layout();
    });
}, 2000);


// $(document).on 'turbolinks:load', ->
//   $('#posts').imagesLoaded ->
//     $('#posts').masonry
//       itemSelector: '.grid-item'
//       isFitWidth: true

  // function reinitializeMasonry(){

  // }

export default masonry
