
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
