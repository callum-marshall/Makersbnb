require 'sinatra/base'
require 'pg'
require_relative 'database_connection_setup'
require 'sinatra/flash'
require './lib/user'
require './lib/listing'
require './lib/booking'


class Makersbnb < Sinatra::Base

enable :sessions
register Sinatra::Flash

  get '/' do
    erb :homepage
  end

  post '/signup' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/listings'
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
    @listings = Listing.all
    erb :listings
  end

  post '/booking/new' do
    booking = Booking.create(listing_id: params[:listing_id], check_in_date: params[:check_in_date], check_out_date: params[:check_out_date], booker_id: session[:user_id])
    session[:booking_id] = booking.id
    redirect '/booking/confirmed'
  end

  get '/booking/confirmed' do
    @booking = Booking.find(session[:booking_id])
    listing_id = @booking.listing_id
    @listing = Listing.find(listing_id)

    @bookings = Booking.find_all_requests(session[:user_id])
    erb :booking_request_confirmed
  end

  get '/listings/new' do

    erb :make_listing
  end

  post '/listings/new/:id' do
    listing = Listing.create(owner_id: session[:user_id], name: params[:name], description: params[:description], price: params[:price])
    redirect '/listings'
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'you have signed out'
    redirect '/'
  end


  run! if app_file == $0
end
