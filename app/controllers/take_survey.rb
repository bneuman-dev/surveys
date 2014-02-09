
get '/surveys/:survey_id' do
  redirect '/' if session[:user_id] == nil
  
  @user = User.find(session[:user_id])
  @survey = Survey.find(params[:survey_id])
  erb :take_survey_form
end

post '/surveys/:survey_id' do
  

  user = User.find(session[:user_id])
  params[:survey].each_pair do |question,answer|
    Response.create(user_id: user.id, possible_answer_id: answer)
  end
  user.surveys_taken << Survey.find(params[:survey_id])
  redirect ('/thank_you')
end

get '/thank_you' do

  erb :thank_you
end
