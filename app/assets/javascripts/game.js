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
      resetScore: function(){
        score = 0;
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

  $('#score').text(COUNTER.getScore())
  $('#answer').focus().one('keypress', function(){
      clearInterval(COUNTER.getCounter())
      COUNTER.resetScore()
      COUNTER.resetSecondsRemaining()
      COUNTER.setCounter(setInterval(function(){
        decrementTime()
      }, 1000))
    }).keypress(function(e) {
      if(e.which == 13) {
        var answer = this.value
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
    $( '#give_up' ).on('click', function(){
      endGame();
      $( '#give_up' ).hide();
    })
}

function updateScores(games) {
  $('body').append(games);
  $( '#saveinitials' ).on('click', function(){
      $.post("/games/updatescore",{
        game_id: $('#game_id').val(),
        yourinitials: $( '#yourinitials' ).val()
      }).done(function(){
        $('#saveinitials').remove();
        $('#yourinitials').replaceWith($( '#yourinitials' ).val())
      })
    });
  $('#highscore_modal').modal('show').on('hidden.bs.modal',function(){
    $('#highscore_modal').remove();
  });
}

function endGame() {
      clearInterval(COUNTER.getCounter());
    $('#timer').text("Time's up!");
    $('#answer').hide()
    // $('#score').text("Your score is " + COUNTER.getScore() + ".")
    $.post("/games/newscore",{
        score: COUNTER.getScore(),
        list_id: $( '#list_id' ).data('listid')
    } ).done(updateScores)
    $('.entry').each(function() {
      $(this).show()
      if($(this).data('answered') != false){
        $(this).css("background-color","green")
      } else {
        $(this).css("background-color","red")
      }
    })
  }

function decrementTime() {
  COUNTER.decrementSecondsRemaining(1)
  var secondsRemaining = COUNTER.getSecondsRemaining()
  if (secondsRemaining <= 0){
    endGame();
  } else {
    var minutes = parseInt(secondsRemaining / 60),
        seconds = secondsRemaining % 60,
        secondsFormatted = (seconds < 10) ? '0' + seconds : seconds;
    $('#timer').text(secondsFormatted);
  }
}
$(document).ready(ready);
$(document).on('page:load', ready);

