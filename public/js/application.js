$(document).ready(function() {

//create three initial fields
  var startingNo = 1;
  var $question = "";
  for(questionCount=0;questionCount<startingNo;questionCount++){
      var displayCount = questionCount+1;
      $question += '<p><label for="question'+displayCount+'">Question '+displayCount+': </label><input type="text" name="question['+displayCount+']" id="question'+displayCount+'" class="required"><button class="removeQuestion">Remove Question</button><br><label for="answers'+displayCount+'">Answers: </label><textarea cols="37" rows="5" name="answer['+displayCount+']"></textarea></p>';
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
    $question = '<p><label for="question'+questionCount+'">Question '+questionCount+': </label><input type="text" name="question['+questionCount+']" id="question'+questionCount+'" class="required"><button class="removeQuestion">Remove Question</button><br><label for="answers'+questionCount+'">Answers: </label><textarea cols="37" rows="5" name="answer['+questionCount+']"></textarea></p>';
    $(this).parent().before($question);
  });










































$(document).ready(function () {

  // send an HTTP DELETE request for the sign-out link
  $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
  });

});
