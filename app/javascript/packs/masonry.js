var elem = document.querySelector('.grid');

if (elem) {
var masonry = new Masonry( elem, {
  itemSelector: '.grid-item',
  itemSelector: '.grid-item',
  columnWidth: '.grid-sizer',
  // "gutter": 20,
  // percentPosition: true,
  isFitWidth: true
});

imagesLoaded( elem ).on( 'progress', function() {
  // layout Masonry after each image loads
  masonry.layout();
});
}
export default masonry
