# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

wait_time = 10000

$(".users.show").ready ->
  button = $('#coinflipsubmitdelay')
  oldValue = button.val()
  button.prop 'disabled', true
  button.val 'Wait please'
  setTimeout (->
    button.val oldValue
    button.prop 'disabled', false
    return
  ), wait_time
