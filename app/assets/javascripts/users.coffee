# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

wait_time = 10000 #in milliseconds

$(".users.show").ready ->
  $('#bet_label').focus()
  button = $('#coinflip_submit_delay')
  oldValue = button.val()
  button.prop 'disabled', true
  button.val 'Wait please'
  $('#bet_text_field').bind 'change paste keyup', ->
    betTextFieldValue = $('#bet_text_field').val()
    if isNaN betTextFieldValue
      return
    betTextField = parseInt betTextFieldValue
    maximumWinningPrice = parseInt $('#hidden_maximum_winning_price').text()
    totalBalance = parseInt $('#total_balance').text() 
    if maximumWinningPrice < betTextField + totalBalance
      alert 'The maximum reward is: $' + maximumWinningPrice + '. Please advise'
    return
  setTimeout (->
    button.val oldValue
    button.prop 'disabled', false
    return
  ), wait_time
  return

$("")
