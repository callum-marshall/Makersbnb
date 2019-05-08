require 'sinatra/base'
require 'pg'
require_relative 'database_connection_setup'

class Makersbnb < Sinatra::Base

enable :sessions

  get '/' do
    erb :homepage
  end

  post '/signup' do
    User.create(email: params[:email], password: params[:password])
    redirect '/'
  end

  get '/login' do
    erb :login
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/listings'
  end

  get '/listings' do
    "welcome #{session[:email]}!"
  end

  run! if app_file == $0
end
