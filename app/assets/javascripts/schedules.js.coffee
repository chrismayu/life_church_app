# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
 $('#start_month').datepicker dateFormat: "dd-mm-yy", yearRange: "-1:+5", changeMonth: true, changeYear: true


jQuery ->
 $('#end_month').datepicker dateFormat: "dd-mm-yy", yearRange: "-1:+5",  changeMonth: true, changeYear: true
