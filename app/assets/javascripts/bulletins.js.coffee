# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
 $('#display_start').datepicker dateFormat: "dd-mm-yy", yearRange: "-1:+5", changeMonth: true, changeYear: true


jQuery ->
 $('#display_till').datepicker dateFormat: "dd-mm-yy", yearRange: "-1:+5",  changeMonth: true, changeYear: true
