require 'pry'
get '/surveys/new' do

  redirect '/' if !session[:user_id]

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
  erb :create_survey_form
end

post '/surveys/create' do
  user = User.find(session[:user_id])
  survey = Survey.create(title: params[:title], description: params[:description], pic_url: params[:pic_url])
  survey.resize_pic
  user.surveys << survey
  params[:question].each_pair do |key, value|
    question = Question.create(question: value)
    survey.questions << question
    answers = params[:answer][key].split("\n")
    answers.each do |answer|
      question.possible_answers << PossibleAnswer.create(text: answer)
    end

  end


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
  redirect "/surveys/#{survey.id}/results"
end
