# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
 $('#sermon_date').datepicker dateFormat: "dd-mm-yy", yearRange: "-1:+5", changeMonth: true, changeYear: true


jQuery ->
 $('#remove_sermon_date').datepicker dateFormat: "dd-mm-yy", yearRange: "-1:+5", changeMonth: true, changeYear: true


$(document).ready ->
  audioSection = $("section#audio")
  $("a.html5").click ->
    audio = $("<audio>",
      controls: "controls"
    )
    url = $(this).attr("href")
    $("<source>").attr("src", url).appendTo audio
    audioSection.html audio
    false

  return
