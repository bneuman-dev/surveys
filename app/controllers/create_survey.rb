require 'pry'
get '/surveys/new' do

  redirect '/' if !session[:user_id]

  erb :create_survey_form
end

post '/surveys/create' do
  user = User.find(session[:user_id])
  survey = Survey.create(title: params[:title], description: params[:description], pic_url: params[:pic_url])
  user.surveys << survey
  params[:question].each_pair do |key, value|
    question = Question.create(question: value)
    survey.questions << question
    answers = params[:answer][key].gsub(/\r/,"").split("\n")
    answers.each do |answer|
      question.possible_answers << PossibleAnswer.create(text: answer)
    end

  end

  redirect "/surveys/#{survey.id}/results"
end
