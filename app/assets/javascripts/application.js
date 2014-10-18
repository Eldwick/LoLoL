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
      secondsRemaining;
    return {
      setCounter: function(interval) {
        counter = interval;
      },
      getCounter: function(){
        return counter;
      },
      decrementSecondsRemaining: function(seconds) {
        secondsRemaining -= seconds
      },
      resetSecondsRemaining: function() {
        secondsRemaining = 3420;
      },
      getSecondsRemaining: function() {
        return secondsRemaining
      }
  }
}()

var time = 30
function decrementTime() {
  time--
  $('#timer').text(time)
}


var ready;
ready = function() {
  $('#timer').text(time)
  setInterval(function(){decrementTime()}, 1000)
  $('#answer').keypress(function(e) {
      if(e.which == 13) {
        answer = this.value
        $('.entry').each(function(){
          var entryAns = $(this).text();
          if(answer == entryAns) {
            $(this).show( "slow" )
          }
        })
      }
  });
}

$(document).ready(ready);
$(document).on('page:load', ready);