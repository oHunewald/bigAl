# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#inventoriesTable').dataTable(
    sPaginationType: "full_numbers"
    bJQueryUI: true);

  $('#inventory_best_till').datepicker
  	dateFormat: 'yy-mm-dd'

  $('#inventory_opened').datepicker
  	dateFormat: 'yy-mm-dd'  	