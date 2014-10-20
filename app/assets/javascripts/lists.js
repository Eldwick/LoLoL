
var ready = function() {
  $('.listInfo').click(function () {
    $.get("/lists/show/"+$(this).attr('value')).done(showInfo)
  })
}

function showInfo(games) {
  $('body').append(games)
  $('#highscore_modal').modal('show').on('hidden.bs.modal',function(){
    $('#highscore_modal').remove();
  });
}

$(document).ready(ready);
$(document).on('page:load', ready);