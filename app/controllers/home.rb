#Profile page: see basic info on the surveys you have created 
#with link to more detailed results

get '/home' do
  redirect to '/' if session[:user_id].nil?
  @user = User.find(session[:user_id])

  survey_records = @user.surveys

  @surveys = survey_records.collect do |s|
    count = UserSurvey.where(survey_id: s.id).count
    survey_hash = s.attributes
    survey_hash["count"] = count
    survey_hash
  end
  erb :home
end