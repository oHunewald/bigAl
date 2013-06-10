// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.ui.datepicker
//= require bootstrap
//= require dataTables/jquery.dataTables
//= require_tree .
//= require jquery-fileupload/basic

$(document).ready(function() {

  // #first_select is the id of our first select box, if the ajax request has been successful,
  // an ajax:success event is triggered.

  $('#first_select').live('ajax:success', function(evt, data, status, xhr) {
    // get second selectbox by its id
    var selectbox2 = $('#second_select');

    // empty it
    selectbox2.empty();

    // we got a JSON array in data, iterate through it

    $.each(data, function(index, value) {
      // append an option
      var opt = $('<option/>');

      // value is an array: [:id, :name]
      opt.attr('value', value[0]);
      // set text
      opt.text(value[1]);
      // append to select
      opt.appendTo(selectbox2);
    });
  });  

});