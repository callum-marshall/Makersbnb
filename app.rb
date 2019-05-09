require 'sinatra/base'
require 'pg'

class Makersbnb < Sinatra::Base

enable :sessions

  get '/' do
    erb :homepage
  end

  post '/signup' do
    session[:email] = params[:email]
    session[:password] = params[:password]
    redirect '/listings'
  end

  get '/login' do
    erb :login
  end

  post '/sessions' do
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{params[:email]}'")
    user = User.new(result[0]['id'], result[0]['email'], result[0]['password'])

    session[:user_id] = user.id
    redirect '/listings'
  end

  get '/listings' do
    "welcome #{session[:email]}!"
  end

  run! if app_file == $0
end
