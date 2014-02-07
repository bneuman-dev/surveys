get '/' do
  #WHEN NOT LOGGED IN:
    #See page that says 'Hey - you can create surveys here!'
    #Page has 'Sign in or sign up' button -> directs to /login
  #WHEN LOGGED IN:
    #Redirects you to /home
  erb :index
end













