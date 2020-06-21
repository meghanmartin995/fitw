var elem = document.querySelector('.grid2');

if (elem) {
var masonry2 = new Masonry( elem, {
  itemSelector: '.grid-item2',
  itemSelector: '.grid-item2',
  columnWidth: '.grid-sizer2',
  // "gutter": 20,
  // percentPosition: true,
  isFitWidth: true
});

imagesLoaded( elem ).on( 'progress', function() {
  // layout Masonry after each image loads
  masonry2.layout();
});
}
export default masonry2
