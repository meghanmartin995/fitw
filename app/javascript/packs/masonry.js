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

function masonryUpdate() {
  setTimeout(function() {
      const masonry = Masonry.data('.grid')
      masonry.reloadItems();
      //$grid.masonry();
    imagesLoaded( elem ).on( 'progress', function() {
    masonry.layout();
  });
  },500);
}

function imageLoad() {
    imagesLoaded( elem ).on( 'progress', function() {
    // layout Masonry after each image loads
    masonry.layout();
    });
  }
 imageLoad()

document.addEventListener('turbolinks:load', () => {
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
  }
});
    imagesLoaded( elem ).on( 'progress', function() {
    // layout Masonry after each image loads
    masonry.layout();
    });

}


export default masonry
