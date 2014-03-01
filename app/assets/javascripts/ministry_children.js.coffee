# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

updateCountdownAttributes = (toRemove, toAdd = null) ->
  for attr in toRemove
    $(".remaining_mc, .countdown_mc").removeClass attr
  if toAdd
    $(".remaining_mc, .countdown_mc").addClass toAdd
    if toAdd is "overlimit"
      $("input.btn.btn-large.btn-primary").attr("disabled", "true")
    else
      $("input.btn.btn-large.btn-primary").removeAttr("disabled")

updateCountdown = ->
  remaining = 140 - $("#ministry_child_description").val().length
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
  $(".countdown_mc").text remaining

$(document).ready ->
  $(".countdown_mc").text 140
  $("#ministry_child_description").change updateCountdown
  $("#ministry_child_description").keyup updateCountdown
  $("#ministry_child_description").keydown updateCountdown
  $("#ministry_child_description").keypress updateCountdown