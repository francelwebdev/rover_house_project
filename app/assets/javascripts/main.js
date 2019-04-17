"use strict";

$(function() {

  // Check for click events on the navbar burger icon
  $(".navbar-burger").click(function() {

      // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
      $(".navbar-burger").toggleClass("is-active");
      $(".navbar-menu").toggleClass("is-active");

  });

  // Flickity
  $('.main-carousel').flickity({
    freeScroll: true,
    wrapAround: true,
    cellAlign: 'left',
    prevNextButtons: false,
    autoPlay: 1500,
    pauseAutoPlayOnHover: false
});

  // owl-carousel 
  $('.owl-carousel').owlCarousel({
    loop:true,
    margin:10,
    // nav:true,
    autoplay:true,
    autoplayTimeout:2000,
    autoplayHoverPause:true,
    center:true,
    responsive:{
        0:{
            items:1
        },
        600:{
            items:4
        },
        1000:{
            items:4
        }
    }
})

  // Erreurs des champs de formulaire
  $("div.field_with_errors input").addClass('is-danger');
  $("div.field_with_errors div.select").addClass('is-danger');
  $("div.field_with_errors textarea.extarea").addClass('is-danger');

// Faire cacher la notification
$("div.notification button.delete").click(function() {
  $(this).parent().hide();
});
});