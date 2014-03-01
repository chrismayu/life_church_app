# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
 
 


jQuery ->
 $('#event_date').datepicker dateFormat: "dd-mm-yy", yearRange: "-1:+5", changeMonth: true, changeYear: true


jQuery ->
 $('#remove_event_date').datepicker dateFormat: "dd-mm-yy", yearRange: "-1:+5", changeMonth: true, changeYear: true


$("document").ready ->
  
  #Twitter
  unless typeof (twttr) is "undefined"
    twttr.widgets.load()
  else
    $.getScript "http://platform.twitter.com/widgets.js"
  
  #Facebook
  unless typeof (FB) is "undefined"
    FB.init
      status: true
      cookie: true
      xfbml: true

  else
    $.getScript "http://connect.facebook.net/en_US/all.js#xfbml=1", ->
      FB.init
        status: true
        cookie: true
        xfbml: true


  
  #Google+
  unless typeof (gapi) is "undefined"
    $(".g-plusone").each ->
      gapi.plusone.render $(this).get(0)

  else
    $.getScript "https://apis.google.com/js/plusone.js"
	
	
 
updateCountdownAttributes = (toRemove, toAdd = null) ->
  for attr in toRemove
    $(".remaining_ev, .countdown_ev").removeClass attr
  if toAdd
    $(".remaining_ev, .countdown_ev").addClass toAdd
    if toAdd is "overlimit"
      $("input.btn.btn-large.btn-primary").attr("disabled", "true")
    else
      $("input.btn.btn-large.btn-primary").removeAttr("disabled")

updateCountdown = ->
  remaining = 240 - $("#event_description").val().length
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
  $(".countdown_ev").text remaining

$(document).ready ->
  $(".countdown_ev").text 240
  $("#event_description").change updateCountdown
  $("#event_description").keyup updateCountdown
  $("#event_description").keydown updateCountdown
  $("#event_description").keypress updateCountdown