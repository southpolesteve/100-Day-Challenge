# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#event_activity_id').on 'change', (e) ->
    activity_id = $(e.target).val()
    $('#miles-minutes').html(units[activity_id])
