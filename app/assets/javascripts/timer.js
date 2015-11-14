$( document ).ready(
  function(){
    var millisecondsInMinute = 60000
    var millisecondsInSecond = 1000
    var secondsInMinute = 60

    var counter = setInterval(timer, millisecondsInSecond); // this makes the timer function to be called every 1000 milliseconds (1 second)

    var minute_duration = ($('.hidden-minute-duration').text()).trim();
    var second_duration = ($('.hidden-second-duration').text()).trim();

    var startText = ($('.hidden-time').text()).trim();
    var start = new Date(parseInt(startText))

    endTime = new Date( start.getTime() + minute_duration * millisecondsInMinute + second_duration * millisecondsInSecond)

    var currentTime = new Date();
    var diff = endTime - currentTime;

    var minute = 0;
    var second = 0;

    if (diff > 0) {
      var deltaInSeconds = Math.abs(endTime - currentTime) / millisecondsInSecond;
      minute = Math.floor(deltaInSeconds / secondsInMinute);
      second = Math.floor(deltaInSeconds % secondsInMinute);
    } else {
      minute = 0;
      second = 0;
    }

    function updateClock() {
      $('#minute').text(minute);
      if (second <= 0 ) {
        $('#second').text("00");
      } else if (second < 10 ){
        $('#second').text("0" + second);
      } else {
        $('#second').text(second);
      }
    }

    function timer() {
      if ( currentTime > endTime || minute <= 0 && second <= 0) {
        //time is up
        clearInterval(counter);
        $("#new_coinflip").trigger("submit.rails");
        return;
      } else {
        switch(second) {
          case 0:
            second = Math.floor(59);
            minute -= Math.floor(1);
            updateClock();
            return
          default:
            second = Math.floor(second) - 1;
            updateClock();
        }
      }
    }
  }
);

