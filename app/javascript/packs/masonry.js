var elem = document.querySelector('.grid');

if (elem) {
var masonry = new Masonry( elem, {
  itemSelector: '.grid-item',
  itemSelector: '.grid-item',
  columnWidth: '.grid-sizer',
  horizontalOrder: true,
  isFitWidth: true
});

function masonryUpdate() {
  setTimeout(function() {
    const masonry = Masonry.data('.grid')
    masonry.reloadItems();
    imagesLoaded( elem ).on( 'progress', function() {
    masonry.layout();
  });
  },500);
}

function imageLoad() {
    imagesLoaded( elem ).on( 'progress', function() {
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
    isFitWidth: true
  });
  }
    imagesLoaded( elem ).on( 'progress', function() {
    masonry.layout();
    });
});
}

var infScroll = new InfiniteScroll( elem, {

  path: "a[rel='next']",
  append: '.grid-item',
  history: false,
  outlayer: masonry,
});

export default masonry
