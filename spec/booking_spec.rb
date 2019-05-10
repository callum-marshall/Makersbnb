require 'booking'
require 'database_helpers'

describe 'booking' do
  it "shows result" do
    user = signup2
    listing = Listing.create(owner_id: user.id, name: 'test_name', description: 'test_description', price: 12.00)

    10.times {Booking.create(listing_id: listing.id, check_in_date: "2000/11/05", check_out_date: "2000/11/06", booker_id: user.id)}

    @bookings = Booking.find_all_requests(1)
    p @bookings
  end
end
