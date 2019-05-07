require 'sinatra/base'

class Makersbnb < Sinatra::Base

  get '/' do
    "welcome to makersbnb"
  end


  run! if app_file == $0
end
