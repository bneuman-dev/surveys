get '/surveys/:survey_id/results/graph' do
  @survey = Survey.find(params[:survey_id])
  redirect '/' if @survey.creator_id != session[:user_id]
  @questions = @survey.questions
  @stats = @questions.collect do |question|
    {question: question, 
    stats: stats_with_percentages(question)}
  end

  erb :d3
end