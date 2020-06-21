var elem = document.querySelector('.grid');


if (elem) {
var pckry = new Packery( elem, {

  itemSelector: '.grid-item',
  columnWidth: '.grid-sizer',
  isFitWidth: true
});

imagesLoaded( elem ).on( 'progress', function() {
  // layout Masonry after each image loads
  pckry.layout();
});

}

export default pckry

