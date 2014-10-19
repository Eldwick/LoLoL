# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

function updateScores(games) {
  $('body').append(games)
  $('#highscore_modal').modal('show').on('hidden.bs.modal',function(){
    $('#highscore_modal').remove();
  });
}