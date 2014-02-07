$(document).ready(function() {

//create three initial fields
  var startingNo = 1;
  var $question = "";
  for(questionCount=0;questionCount<startingNo;questionCount++){
      var displayCount = questionCount+1;
      $question += '<p><label for="question'+displayCount+'">Question '+displayCount+': </label><input type="text" name="question'+displayCount+'" id="question'+displayCount+'"><span class="removeQuestion">Remove Question</span><br><label for="answers'+displayCount+'">Answers: </label><textarea cols="37" rows="5" name="answers'+displayCount+'"></textarea></p>';
  }
//add them to the DOM
  $('form').prepend($question);
//remove a textfield
  $('form').on('click', '.removeQuestion', function(){
     $(this).parent().remove();

  });
  //add a new node
  $('#addQuestion').on('click', function(){
    questionCount++;
    $question = '<p><label for="question'+questionCount+'">Question '+questionCount+': </label><input type="text" name="question'+questionCount+'" id="question'+questionCount+'"><span class="removeQuestion">Remove Question</span><br><label for="answers'+questionCount+'">Answers: </label><textarea cols="37" rows="5" name="answers'+questionCount+'"></textarea></p>';
    $(this).parent().before($question);
  });




});

