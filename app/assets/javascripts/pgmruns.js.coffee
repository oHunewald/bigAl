# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$('#pgmrunsTable').dataTable
		sPaginationType: "full_numbers"
		bJQueryUI: true

	$('#pgmrun_run_date').datepicker
		dateFormat: 'yy-mm-dd'	

	$('#pgmrun_ot_date').datepicker
		dateFormat: 'yy-mm-dd'			