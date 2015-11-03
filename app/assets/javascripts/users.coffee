# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

wait_time = 10000 #in milliseconds

$(".users.show").ready ->
  $('#bet_label').focus()
  button = $('#coinflip_submit_delay')
  waiting = true
  oldValue = button.val()
  button.prop 'disabled', true
  button.val 'Wait please'
  $('input[name="coinflip[winning_flip]"]').change ->
    if waiting
      return
    button.prop 'disabled', false
    return
  $('#bet_text_field').bind 'change paste keyup', ->
    betTextFieldValue = $('#bet_text_field').val()
    if isNaN betTextFieldValue
      return
    betTextField = parseInt betTextFieldValue
    maximumWinningPrice = parseInt $('#hidden_maximum_winning_price').text()
    totalBalance = parseInt $('#total_balance').text() 
    if maximumWinningPrice < betTextField + totalBalance && betTextField <= totalBalance
      alert 'The maximum reward is: $' + maximumWinningPrice + '. Please advise'
    return
  setTimeout (->
    waiting = false
    button.val oldValue
    radio_button = $('input[name="coinflip[winning_flip]"]:checked').val()
    if typeof radio_button == 'undefined'
      return
    button.prop 'disabled', false
    return
  ), wait_time
  return

$("")
