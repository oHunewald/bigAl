# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#templates_table').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true

  $('#usertemplates_table').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true

  $('#template_date_bioanalyser').datepicker
	dateFormat: 'yy-mm-dd'	