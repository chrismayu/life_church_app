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