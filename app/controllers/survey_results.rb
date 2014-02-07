
get '/surveys/:survey_id/results' do

  @survey = Survey.find(params[:survey_id])
  @questions = @survey.questions
  @question_stats = @questions.map do |q|
    {question: q.question, stats: question_response_stats(q)}
  end

 @question_stats
 erb :survey_results
end


get '/user_responses/:response_id' do
  user_survey = UserSurvey.find(params[:response_id])
  @user = user_survey.user
  @survey = user_survey.survey
  questions = @survey.questions
  @answers = questions.collect do |question|
    poss = question.possible_answer_ids
    response = Response.where(user_id: @user.id, possible_answer_id: poss).first

    {question: question.question, response: response.possible_answer.text}
  end

  erb :user_responses

end


#From survey results:
  #Feature: maybe for open-ended questions, just list all the answers given
  #MAYBE FEATURE: Links to 'individual responses', which chunks responses by user ->
    #sends us to /surveys/:survey_id/responses
  #REALLY MAYBE FEATURE: #A graphical representation of the table


















get '/surveys/:survey_id/responses' do

   #THIS FEATURE LOOKS LIKE WORK. Part of SurveyMonkey but not part of MVP
  #NOTE: WHEN WE SAY 'responses' here we mean 'user_surveys' in the models

  #Lists all the users who have taken the survey by:
  #Looking up everything in user_surveys with survey_id

  #Each entry in the list will take us to ->
    #/surveys/:survey_id/responses/:response_id

    #MAYBE FEATURE: Ability  to edit and delete each response
      #Makes sense maybe for deleting spam/robots who take surveys
      #Maybe would use routes like
      #/surveys/:survey_id/responses/:response_id/delete
end


  #THIS FEATURE LOOKS LIKE WORK. Part of SurveyMonkey but not part of MVP

  #This should list:
    #Basic user info
    #Time survey taken
    #List of every question and the response given

  #We know survey_id via user_surveys
  #From survey_id, we know all the question_ids
  #For each question_id:
    #Look up all the possible_answers corresponding to that question
    #Find which entry in 'responses' table has the user_id of the
    #survey-taker and has one of the possible_answers in that list

  #We can look this up by:
    #Looking up
# end
