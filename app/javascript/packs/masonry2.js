var elem = document.querySelector('.grid2');

if (elem) {
var masonry2 = new Masonry( elem, {
  itemSelector: '.grid-item2',
  itemSelector: '.grid-item2',
  columnWidth: '.grid-sizer2',
  isFitWidth: true
});

imagesLoaded( elem ).on( 'progress', function() {
  masonry2.layout();
});


}
export default masonry2
