# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
 $(".email_giver_drop_down").hide()
 $("#email_giver").change ->
	 if @value is "United States"
		 $(".email_giver_drop_down").show(300)
	 else
		 $(".email_giver_drop_down").hide(300)