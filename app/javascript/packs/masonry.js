document.addEventListener('turbolinks:load', () => {
  const elem = document.querySelector('.grid');
  if (elem) {
    const masonry = new Masonry(elem, {
      itemSelector: '.grid-item',
      columnWidth: '.grid-sizer',
      horizontalOrder: true,
      isFitWidth: true,
      stagger: 30,
      visibleStyle: { transform: 'translateY(0)', opacity: 1 },
      hiddenStyle: { transform: 'translateY(100px)', opacity: 0 },
    });

    imagesLoaded(elem).on('progress', function () {
      masonry.layout();
    });

    const nextLink = document.querySelector("a[rel='next']")

    if (nextLink) {
      const infScroll = new InfiniteScroll(elem, {
        path: "a[rel='next']",
        append: '.grid-item',
        history: false,
        outlayer: masonry,
      });
    }
  }
});
