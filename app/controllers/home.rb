get '/home' do
  #IF NOT LOGGED IN:
    #Redirect to '/login'


  #Have 'create survey' button ->
    #LINKS TO '/surveys/new'

  #See list of your surveys
    #List of surveys includes basic info on each survey:
      #Title (links to more detailed survey results)
          #The link to more detailed survey results will send us to: /surveys/:survey_id/results
      #Date created
      #Number of people who have taken the survey
      #Date modified
      #Edit button (maybe we will implement this, maybe not)
      #Maybe also include 'delete' button and 'clear out responses' button

  #Look up user via session[:user_id]
  #Then look up user's surveys in 'surveys' table
  #Look up number of people who have taken the survey in 'user_surveys' table
end
