// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
var COUNTER = function() {
  var counter,
      secondsRemaining,
      score = 0;
    return {
      setCounter: function(interval) {
        counter = interval;
      },
      getCounter: function(){
        return counter;
      },
      decrementSecondsRemaining: function(seconds) {
        secondsRemaining -= seconds;
      },
      resetSecondsRemaining: function() {
        secondsRemaining = $('#timer').data('time');
      },
      getSecondsRemaining: function() {
        return secondsRemaining
      },
      addScore: function(){
        score++
      },
      getScore: function() {
        return score
      }
  }
}()



var ready;
ready = function() {
  COUNTER.resetSecondsRemaining()
  COUNTER.setCounter(setInterval(function(){
    decrementTime()
  }, 1000))

  $('#score').text(COUNTER.getScore())
  $('#answer').keypress(function(e) {
      if(e.which == 13) {
        answer = this.value
        $('.entry').each(function(){
          var entryAns = $(this).text();
          if(answer.toLowerCase() == entryAns.toLowerCase()) {
            $(this).show( "slow" )
            COUNTER.addScore()
            $('#score').text(COUNTER.getScore())
            $(this).data( "answered", true );
          }
          $('#answer').val("")
        })
      }
  });
}

function decrementTime() {
  COUNTER.decrementSecondsRemaining(1)
  var secondsRemaining = COUNTER.getSecondsRemaining()
  if (secondsRemaining <= 0){
    clearInterval(COUNTER.getCounter());
    $('#timer').text("Time's up!");
    $('#answer').hide()
    $('#score').text("Your score is " + COUNTER.getScore() + ". Congrats!")
    $('.entry').each(function() {
      $(this).show()
      if($(this).data('answered') != false){
        $(this).css("background-color","green")
      } else {
        $(this).css("background-color","red")
      }
    })
  } else {
    var minutes = parseInt(secondsRemaining / 60),
        seconds = secondsRemaining % 60,
        secondsFormatted = (seconds < 10) ? '0' + seconds : seconds;
    $('#timer').text(secondsFormatted);
  }
}
$(document).ready(ready);
$(document).on('page:load', ready);