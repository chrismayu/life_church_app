# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

 

jQuery ->
 $('#birthday').datepicker dateFormat: "dd-mm-yy", yearRange: "-90:+0", changeMonth: true, changeYear: true

jQuery ->
 $('#start_date').datepicker dateFormat: "dd-mm-yy", yearRange: "-10:+0", changeMonth: true, changeYear: true

updateCountdownAttributes = (toRemove, toAdd = null) ->
  for attr in toRemove
    $(".remaining, .countdown").removeClass attr
  if toAdd
    $(".remaining, .countdown").addClass toAdd
    if toAdd is "overlimit"
      $("input.btn.btn-large.btn-primary").attr("disabled", "true")
    else
      $("input.btn.btn-large.btn-primary").removeAttr("disabled")

updateCountdown = ->
  remaining = 240 - $("#church_staff_description").val().length
  toRemove = ["nearlimit", "almostlimit", "overlimit"]
  if remaining > 19
    updateCountdownAttributes(toRemove)
  if remaining < 20
    toAdd = (toRemove.filter (attr) -> attr is "nearlimit").toString()
    updateCountdownAttributes(toRemove, toAdd)
  if remaining < 11
    toAdd = (toRemove.filter (attr) -> attr is "almostlimit").toString()
    updateCountdownAttributes(toRemove, toAdd)
  if remaining < 0
    toAdd = (toRemove.filter (attr) -> attr is "overlimit").toString()
    updateCountdownAttributes(toRemove, toAdd)
  $(".countdown").text remaining

$(document).ready ->
  $(".countdown").text 240
  $("#church_staff_description").change updateCountdown
  $("#church_staff_description").keyup updateCountdown
  $("#church_staff_description").keydown updateCountdown
  $("#church_staff_description").keypress updateCountdown