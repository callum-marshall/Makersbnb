require 'sinatra/base'
require 'pg'
require_relative 'database_connection_setup'
require 'sinatra/flash'
require './lib/user'


class Makersbnb < Sinatra::Base

enable :sessions
register Sinatra::Flash

  get '/' do
    erb :homepage
  end

  post '/signup' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/listings'
    else
      flash[:notice] = 'wrong email or password'
      redirect '/login'
    end
  end

  get '/listings' do
    @user = User.find(session[:user_id])
    erb :listings
  end


  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'you have signed out'
    redirect '/'
  end


  run! if app_file == $0
end
