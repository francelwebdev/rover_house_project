//= require jquery/dist/jquery.min
//= require popper.js/dist/umd/popper.min
//= require bootstrap/dist/js/bootstrap.min
//= require rails-ujs
//= require activestorage
//= require turbolinks

//= require local-time
//= require cocoon


$("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
});