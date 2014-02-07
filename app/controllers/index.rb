get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/create_survey_form' do
  erb :create_survey_form
end
