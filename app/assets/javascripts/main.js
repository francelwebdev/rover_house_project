$(document).on("turbolinks:load", function() {
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
    prevNextButtons: true,
    autoPlay: 1500,
    pauseAutoPlayOnHover: true,
    draggable: false,
    pageDots: true
  });

  // owl-carousel 
  $('.owl-carousel').owlCarousel({
    loop:true,
    margin:10,
    // nav:true,
    autoplay:true,
    autoplayTimeout:2000,
    autoplayHoverPause:true,
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
  $("div.field_with_errors + div.control > div.select").addClass('is-danger');
  $("div.field_with_errors textarea.textarea").addClass('is-danger');
  
  // $("input[aria-invalid=true]").addClass('is-danger');
  // $("div.select > select[aria-invalid=true]").parent().addClass('is-danger');
  // $("textarea[aria-invalid=true]").addClass('is-danger');


// Faire cacher la notification
$("div.notification button.delete").on("click", function() {
  $(this).parent().hide();
});


$('.slick').slick({
  infinite: true,
  dots: true,
  speed: 300,
  slidesToShow: 3,
  slidesToScroll: 3,
  autoplay: true,
});

// $("form#my-awesome-dropzone").dropzone({ url: "/fr/properties/post" });
  // Dropzone.autoDiscover = false;
  // var dropzone = new Dropzone ("#my-awesome-dropzone", {
  //   maxFilesize: 256, // Set the maximum file size to 256 MB
  //   paramName: "image[avatar]", // Rails expects the file upload to be something like model[field_name]
  //   addRemoveLinks: false // Don't show remove links on dropzone itself.
  // });

  // dropzone.on("success", function(file) {
  //   this.removeFile(file)
  //   $.getScript("/images")
  // })
  

});

