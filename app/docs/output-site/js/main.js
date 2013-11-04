$(document).ready(function() {
$('body').addClass('js');

  var $navSlide = $('.nav--slide'),
    $menulink = $('.menu-link'),
    $page = $('.page'),
    $gridlink = $('.grid-link'),
    $container = $('.container');

  $menulink.click(function() {
    $menulink.toggleClass('is-active');
    $navSlide.toggleClass('is-active');
    $page.toggleClass('is-slide');
    return false;
  });

  $gridlink.click(function() {
    $container.toggleClass('active-grid');
  });

}); 

