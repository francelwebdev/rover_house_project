$(document).on("turbolinks:load", function() {

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
        items: 3
    },
    1024: {
        items: 3
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


  $("a.re-avance").on("click", function (e) {
    e.preventDefault();
    e.stopPropagation();
    $("div.avec-et-sans-is-sr-only").toggleClass("sr-only");
})


  if ($("select#property_ad_type_id").val() == "1") {
    $("input#property_price_for_sale").parent().parent().hide();
    $("input#property_price_for_rent").parent().parent().show();
} else if ($("select#property_ad_type_id").val() == "2") {
    $("input#property_price_for_sale").parent().parent().show();
    $("input#property_price_for_rent").parent().parent().hide();
}

$("select#property_ad_type_id").on("change", function () {
    let leSelected = $("select#property_ad_type_id option:selected");
    if (leSelected.val() == "2") {
      $("input#property_price_for_sale").parent().parent().show();
      $("input#property_price_for_rent").parent().parent().hide();
  } else if (leSelected.val() == "1") {
      $("input#property_price_for_sale").parent().parent().hide();
      $("input#property_price_for_rent").parent().parent().show();
  }
})

});