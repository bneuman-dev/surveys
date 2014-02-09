$(document).ready(function() {

//create three initial fields
  var startingNo = 1;
  var $question = "";
  for(questionCount=0;questionCount<startingNo;questionCount++){
      var displayCount = questionCount+1;
      $question += '<p><label for="question'+displayCount+'">Question '+displayCount+': <br> </label><input type="text" size="50" name="question['+displayCount+']" id="question'+displayCount+'" class="required"><button class="removeQuestion">Remove Question</button><br><label for="answers'+displayCount+'">Answers: </label><textarea cols="50" rows="5" name="answer['+displayCount+']" class="required"></textarea></p>';
  }
//add them to the DOM
  $('.question').prepend($question);
//remove a textfield
  $('form').on('click', '.removeQuestion', function(e){
     e.preventDefault();
     $(this).parent().remove();

  });
  //add a new node
  $('#addQuestion').on('click', function(e){
    e.preventDefault();
    questionCount++;
    $question = '<p><label for="question'+questionCount+'">Question '+questionCount+': <br> </label><input type="text" size="50" name="question['+questionCount+']" id="question'+questionCount+'" class="required"><button class="removeQuestion">Remove Question</button><br><label for="answers'+questionCount+'">Answers: </label><textarea cols="50" rows="5" name="answer['+questionCount+']" class="required"></textarea></p>';
    $(this).parent().before($question);
  });



  $('form').on('submit', function(e){
    if(check_form()===false){
      e.preventDefault();
    }

  });






});

// var check_form = function(){
//   var title = document.forms["create"]["title"].value;
//   if (title==null || title==""){
//     alert("Your form must include a title.");
//     return false;
//   }
// }

var check_form = function(){
  var status = true;

  $('form .required').each(function(){
    if ((this).value===null || (this).value===""){
      status = false;
    }
  });
  if (status ===false){alert("You must fill out all title, question, and answer fields to submit your survey.");}
  return status;
}

//   var check_form = function(){
//   console.log("something happening");
//   var flag = true;
//   $('form .required').each(function(){
//     if ($(this)).val()===""){
//       show_dialog('Please enter a value for ' + $(this).attr('name'));
//       flag = false;
//     }
//   });
//   return flag;
// }
