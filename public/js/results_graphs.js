$(document).ready( function () {

  $(".graph_percent").each(function () {
    var percent = $(this).data().percent + "%";
    $(this).css("width", percent);
  })

})