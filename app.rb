require 'sinatra/base'

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

  get '/listings' do
    "welcome #{session[:email]}!"
  end
  
  run! if app_file == $0
end
