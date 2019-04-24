  $(document).on("turbolinks:load", function () {
    // Check for click events on the navbar burger icon
    $(".navbar-burger").click(function () {
      // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
      $(".navbar-burger").toggleClass("is-active");
      $(".navbar-menu").toggleClass("is-active");

    });

    // Faire cacher la notification
    $("div.notification button.delete").on("click", function () {
      $(this).parent().hide();
    });
    // Faire cacher la notification

    $(".owl-home-page").owlCarousel({
      loop: true,
      margin: 10,
      nav: false,
      autoplay: true,
      autoplayTimeout: 3000,
      autoplayHoverPause: false,
      responsiveClass: true,
      responsive: {
        0: {
          items: 1
        },
        550: {
          items: 2
        },
        800: {
          items: 2
        },
        900: {
          items: 4
        },
        1024: {
          items: 4
        }
      }
    });

    $(".owl-property-show-page").owlCarousel({
      loop: true,
      margin: 10,
      nav: false,
      autoplay: true,
      autoplayTimeout: 3000,
      autoplayHoverPause: false,
      responsiveClass: true,
      responsive: {
        0: {
          items: 1
        },
        600: {
          items: 1
        },
        1000: {
          items: 1
        }
      }
    });

    // Erreurs des champs de formulaire
    $("div.field_with_errors input").addClass('is-danger');
    $("div.field_with_errors div.select").addClass('is-danger');
    $("div.field_with_errors + div.control > div.select").addClass('is-danger');
    $("div.field_with_errors textarea.textarea").addClass('is-danger');

    // $("input[aria-invalid=true]").addClass('is-danger');
    // $("div.select > select[aria-invalid=true]").parent().addClass('is-danger');
    // $("textarea[aria-invalid=true]").addClass('is-danger');
    // Erreurs des champs de formulaire

    $("a.re-avance").on("click", function (e) {
      e.stopPropagation();

      // if ($("div.avec-et-sans-is-sr-only").hasClass("is-sr-only")) {
      //   $("div.avec-et-sans-is-sr-only").removeClass("is-sr-only");
      // } else {
      //   $("div.avec-et-sans-is-sr-only").addClass("is-sr-only");
      // }

      $("div.avec-et-sans-is-sr-only").toggleClass("is-sr-only");
    })

  });