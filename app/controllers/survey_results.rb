
#see results summary for a given survey
get '/surveys/:survey_id/results' do

  @survey = Survey.find(params[:survey_id])

  redirect '/' if @survey.creator_id != session[:user_id]

  @questions = @survey.questions.order('id')
  @question_stats = @questions.map do |q|
    {question: q.question, stats: question_response_stats(q)}
  end

 @question_stats
 erb :survey_results
end


#See a given user's responses to a survey
get '/user_responses/:response_id' do
  user_survey = UserSurvey.find(params[:response_id])
  @user = user_survey.user
  @survey = user_survey.survey

  redirect '/' if @survey.creator_id != session[:user_id]

  questions = @survey.questions
  @answers = questions.collect do |question|
    poss = question.possible_answer_ids
    response = Response.where(user_id: @user.id, possible_answer_id: poss).first

    {question: question.question, response: response.possible_answer.text}
  end

  erb :user_responses

end

#see a list of users who responded to a survey
#each entry links to a page to view that user's responses to the survey
get '/surveys/:survey_id/responses' do
  @survey = Survey.find(params[:survey_id])

  redirect '/' if @survey.creator_id != session[:user_id]

  @survey_responses = @survey.user_surveys
  erb :survey_responses
end