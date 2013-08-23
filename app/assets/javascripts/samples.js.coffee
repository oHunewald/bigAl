# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#samples').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
    bAutoWidth: false,
    sScrollY: "300",
    sScrollX: "50%",
    sScrollXInner: "100%",
    bScrollCollapse: true