get '/' do

  redirect '/home' if session[:user_id]

  @users = User.all

  erb :index
end













