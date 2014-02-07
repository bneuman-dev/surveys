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
    @survey = Survey.find(params[:survey_id])
    erb :take_survey_form
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
