// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize-sprockets
//= require owl.carousel
//= require underscore
//= require gmaps/google
//= require_tree .

$(document).ready(function(){
  $('.slider').slider({full_width: true});
  $('.parallax').parallax();
  $('.materialboxed').materialbox();
  $(".owl-carousel").owlCarousel({
    singleItem: true,
  });
  $('.collapsible').collapsible();
  $(".button-collapse").sideNav();
  $('.tooltipped').tooltip({delay: 50});
  // nav bar
 //  $(".nav_hover").hover(function(){
 //    $(this).css("background-color", "#B1AB6F;");
 //    }
	// });

});
