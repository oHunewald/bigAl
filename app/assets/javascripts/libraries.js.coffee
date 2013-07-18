# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#libraries').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true

  $('#library_lib_date').datepicker
  	dateFormat: 'yy-mm-dd'

  $('#library_date_bioanalyser').datepicker
  	dateFormat: 'yy-mm-dd'  	
  
  	$("#comment_why").hide()

  $("#box_failed").click ->
  	$("#comment_why").toggle()