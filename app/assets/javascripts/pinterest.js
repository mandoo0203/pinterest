
$(document).ready(masonryAllTheThings);
$(document).on('page:load', masonryAllTheThings);


function masonryAllTheThings(){
  $('.pinterest-grid').imagesloaded(function(){
    $('.pinterest-grid').masonry({
      itemSelector: '.pin-item',
      columnWidth: '.pin-item'
    });
  });
}
