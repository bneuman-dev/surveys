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
