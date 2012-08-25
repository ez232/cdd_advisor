// This is a manifest file that'll be compiled into application.js, which will
// include all the files listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts,
// vendor/assets/javascripts, or vendor/assets/javascripts of plugins, if any,
// can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at
// the bottom of the the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY
// BLANK LINE SHOULD GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui 
//= require jquery_ujs
//= require_tree .

function remove_fields(link, show_add) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide("blind", {direction: "vertical"}, 250);

  if (show_add = true) {
    $(link).closest(".fields").parent().next("p").children().show();
  }
}

function add_fields(link, association, content, hide_add) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
  $(link).parent().prev(".fields").show("blind", {direction: "vertical"}, 250);

  if (hide_add == true) {
    $(link).hide();
  }
}