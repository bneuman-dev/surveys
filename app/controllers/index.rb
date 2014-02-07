get '/' do
  #WHEN NOT LOGGED IN:
    #See page that says 'Hey - you can create surveys here!'
    #Page has 'Sign in or sign up' button -> directs to /login
  #WHEN LOGGED IN:
    #Redirects you to /home
  erb :index
end

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

get '/surveys/:survey_id' do
  #Must be logged in to take survey
    #Maybe redirect if not logged in
    #Maybe you can view but 'submit' button doesn't work

  #THIS IS THE LINK FOR TAKING A SURVEY

  #Display title
  #Display survey description

  #Display each question
    #Displays each answer under it with appropriate input type
    #For now, we probably just want multiple choice questions with radio button
      #NAMING:
        #For each question:
          #Pull all the possible answers for that question
          #The 'name' for each answer field SHOULD INCLUDE THE POSSIBLE_ANSWER ID
            #E.g., some answer might be the 3rd possible answer to a question
            #That answer has ID 1000 because it is the 1000th answer in the DB
            #Its name should be <input name=answer1000>
            #This will make our lives much easier on the parsing end


    #'Done' button at end ->
      #Directs to POST '/surveys/:survey_id'
      #Or maybe call it '/surveys/:survey_id/submit' or
      #'/surveys/:survey_id/create_response'

    #JQuery should probably check that ALL QUESTIONS ARE FILLED OUT
    #Display error messages if not
    #Steal from Thursday challenge to do this
end

post '/surveys/:survey_id' do
  #THIS PARSERS ANSWERS TO SURVEY

  #Pulls :user_id from session

  #Probably adds entry to user_surveys, with user_id and survey_id

  #For each selected possible answer:
    #Add entry to 'responses' with possible_answer_id and user_id

  #REDIRECT TO PAGE THANKING YOU AND ASKING FOR MONEY
end

get '/thank_you' do
  #Thank you for taking the survey! Give us money.
  #Should include link to go back home.
end

get '/surveys/:survey_id/results' do

  #Displays 'question summaries'
    #For each survey question we see:
    #A table that breaks down percentage of respondents who picked each choice
    #A graphical representation of the table
    #Feature: maybe for open-ended questions, just list all the answers given

  #For survey:
    #Look up all questions with survey_id
    #For each question:
      #Look up all possible_answers with question_id
      #Then, look up all responses with possible_answer_id

  #MAYBE FEATURE: Links to 'individual responses', which chunks responses by user ->
    #sends us to /surveys/:survey_id/responses
end

get '/surveys/new' do
  #Form with:

  #Title field -> name = title
  #Description field (TEXTAREA?) -> name = description
  #Pic url -> name=pic_url
    #FEATURE: an upload form for picture, automagically gets us the right URL

  #Question/answer stuff:

  #Question field -> name = questions[question1]
  #Answer field -> name = questions[answer1]
    #Text area
    #Each possible answer goes on new line

  #Automagical JQuery button:
    #Adds another question field and answer field
    #Increments the question and answer number -
      #So, for second question, <input name='questions[question2]>

  #Create survey button:
    #POST '/surveys/create'

  #JQuery should probably check that ALL QUESTIONS ARE FILLED OUT
    #Display error messages if not
    #Steal from Thursday challenge to do this

  #We really should validate on the backend with :presence => true and stuff
  #Then we could redirect to error pages
  #However, that's extra work
end

post '/surveys/create' do
  #Creates a new survey with title, description, pic_url from params
  #Also uses :user_id from session

  #Then steps through each question
    #Creates question in database for each question
    #Creates possible_answer for each answer for each question

  #Redirects to someplace:
    #Maybe the survey itself
    #Maybe the survey results page
    #Maybe it goes to a really simple the survey link
    #Wherever it goes, MUST HAVE SURVEY LINK

end

get '/login' do
  #Two forms, one for login, one for signup

  #Login has username/password
  #Sign in button redirects to POST /login

  #Signup form
  #username, password, email, name, SSN
  #Create account button redirects to POST /create_account
end

post '/login' do
  #Checks username/password
  #Redirects back to '/login' if fails authentication
  #Bonus points: Somehow flag that it is an error and display it

  #If valid:
    #sets session[:user_id]
    #redirects to /home
end

get '/logout' do
  #session.delete(:user_id)
end

post '/create_account' do
  #Makes User
  #If validation problem: blank field, username already existed -
    #Redirect to '/login'
    #Bonus points for displaying error

  #If valid
    #Sets session[:user_id]
    #Redirects to '/home'
end










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

get '/surveys/:survey_id/responses/:response_id' do
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
end

