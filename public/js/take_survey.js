$(document).ready(function() {

  $('form').on('submit', function(e){
    if(check_form()===false){
      e.preventDefault();
    }
  });

});



var check_form = function(){
  var status = true;

  $("input:radio").each(function(){
    var name = $(this).attr("name");
    if(!($("input[name='"+name+"']").is(":checked")))
    {
      status = false;
    }
  });

  if (status === false){alert("You need to answer all survey questions to submit it.");}
  return status;
}


// $("input[name='survey[2]']").is(":checked")
