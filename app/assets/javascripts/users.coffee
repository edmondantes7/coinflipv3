# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

wait_time = 500 #in milliseconds


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
  $('#coinflip_submit_delay').hide(100)
  $('#bet_text_field').bind 'change paste keyup', ->
    betTextFieldValue = $('#bet_text_field').val()
    if isNaN betTextFieldValue
      return
    betTextField = parseInt betTextFieldValue
    maximumWinningPrice = parseInt $('#hidden_maximum_winning_price').text()
    totalBalance = parseInt $('#total_balance').text() 
    if maximumWinningPrice < betTextField + totalBalance && betTextField <= totalBalance
      alert 'Good flipping. You are within range of $' + maximumWinningPrice + ', which is the maximum we will pay out to you, even if you wind up with more in your balance at the end of this experiment. You may want to reconsider your bet, in light of this $' + maximumWinningPrice + ' cap on what we’ll pay out to you. Good luck and happy flipping!'
    return
  setTimeout (->
    waiting = false
    $("#animation").hide(100)
    $("#betting-on").hide(100)
    $("#right-container-load").show(100)
    $("#history-table").show(100)
    $("#coinflip_submit_delay").show(100)
    button.val oldValue
    radio_button = $('input[name="coinflip[winning_flip]"]:checked').val()
    if typeof radio_button == 'undefined'
      return
    button.prop 'disabled', false
    return
  ), wait_time
  return

$("")