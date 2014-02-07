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






  #IF NOT LOGGED IN:
    #Redirect to '/login
  #Have 'create survey' button ->
    #LINKS TO '/surveys/new'


#Survey list maybes:
  #Edit button (maybe we will implement this, maybe not)
  #Maybe also include 'delete' button and 'clear out responses' button

# Development purposes

# get '/cookie' do
#   session.inspect
# end

# get '/fake_login' do
#   session[:user_id] = "2"
# end

# get '/fake_logout' do
#   session.delete(:user_id)
# end

# get '/clear_cookie' do
#   session.clear
# end
