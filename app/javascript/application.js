// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import "controllers"
'use strict';


var onTop = true;

// JQuery
$(window).scroll(function() {
  let scrollPosition = $(window).scrollTop();
  
  if(scrollPosition < 150 && !onTop) {
    onTop = true;
    $('.navbar').addClass('onTop');
  }
  
  if(scrollPosition > 150 && onTop) {
    onTop = false;
    $('.navbar').removeClass('onTop');
  }
});