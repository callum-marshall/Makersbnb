ogrequire 'pg'
require_relative './database_connection'

# Booking.create(listing_id: params[:listing_id],
#    check_in_date: params[:check_in_date],
#    check_out_date: params[:check_out_date],
#    booker_id: params[:booker_id])

class Booking

def self.create(listing_id:, check_in_date:, check_out_date:, booker_id:)
  result = DatabaseConnection.query("INSERT INTO bookings (listing_id, check_in_date, check_out_date, booker_id) VALUES ('#{listing_id}','#{check_in_date}','#{check_out_date}','#{booker_id}') RETURNING id, booker_id, check_in_date, check_out_date, booker_id;")
  Booking.new(id: result[0]['id'], listing_id: result[0]['listing_id'], check_in_date: result[0]['check_in_date'], check_out_date: result[0]['check_out_date'], booker_id: result[0]['booker_id'])
end

attr_reader :id, :listing_id, :check_in_date, :check_out_date, :booker_id

def initialize(id:, listing_id:, check_in_date:, check_out_date:, booker_id:)
  @id = id
  @listing_id = listing_id
  @check_in_date = check_in_date
  @check_out_date = check_out_date
  @booker_id = booker_id
end

def self.find(id)
  return nil unless id
  result = DatabaseConnection.query("SELECT * FROM bookings WHERE id = '#{id}'")
  Booking.new(id: result[0]['id'], listing_id: result[0]['listing_id'], check_in_date: result[0]['check_in_date'], check_out_date: result[0]['check_out_date'], booker_id: result[0]['booker_id'])
end

def self.find_all_requests(booker_id)
  return nil unless booker_id
  result = DatabaseConnection.query("SELECT * FROM bookings WHERE booker_id = '#{booker_id}'")
  result.values.map do |result|
    Booking.new(id: result[0], listing_id: result[1], check_in_date: result[2], check_out_date: result[3], booker_id: result[4])
  end
end
end
