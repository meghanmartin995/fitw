//-------------------------------------//

// var grid = document.querySelector('.grid');

// var msnry = new Masonry( grid, {
//   itemSelector: 'none',
//   columnWidth: '..grid-sizer',
//   isFitWidth: true,
//   stagger: 30,
//   visibleStyle: { transform: 'translateY(0)', opacity: 1 },
//   hiddenStyle: { transform: 'translateY(100px)', opacity: 0 },
// });


// // initial items reveal
// imagesLoaded( grid, function() {
//   grid.classList.remove('are-images-unloaded');
//   msnry.options.itemSelector = '.grid-item';
//   var items = grid.querySelectorAll('.grid-item');
//   msnry.appended( items );
// });


// // init Infinte Scroll

// var infScroll = new InfiniteScroll( grid, {
//   path: "a[rel='next']",
//   append: '.grid-item',
//   outlayer: msnry,
//   status: '.page-load-status',
// });










var elem = document.querySelector('.grid');

if (elem) {
var masonry = new Masonry( elem, {
  itemSelector: '.grid-item',
  itemSelector: '.grid-item',
  columnWidth: '.grid-sizer',
  horizontalOrder: true,
  isFitWidth: true,
  stagger: 30,
  visibleStyle: { transform: 'translateY(0)', opacity: 1 },
  hiddenStyle: { transform: 'translateY(100px)', opacity: 0 },
});

  imagesLoaded( elem ).on( 'progress', function() {
  masonry.layout();
  });

document.addEventListener('turbolinks:load', () => {
  var elem = document.querySelector('.grid');

  var masonry = new Masonry( elem, {
    itemSelector: '.grid-item',
    itemSelector: '.grid-item',
    columnWidth: '.grid-sizer',
    horizontalOrder: true,
    isFitWidth: true,
    stagger: 30,
    visibleStyle: { transform: 'translateY(0)', opacity: 1 },
    hiddenStyle: { transform: 'translateY(100px)', opacity: 0 },
  });

    imagesLoaded( elem ).on( 'progress', function() {
    masonry.layout();
    });
});


var infScroll = new InfiniteScroll( elem, {

  path: "a[rel='next']",
  append: '.grid-item',
  history: false,
  outlayer: masonry,
});
}

//export default masonry
