require 'listing'
require 'user'
require 'setup_test_database'
require 'test_helpers'

describe Listing do

  describe '.create' do
    it "creates a new listing" do
      user = signup2
      listing = Listing.create(owner_id: user.id, name: 'test_name', description: 'test_description', price: 12.00)

      expect(listing).to be_a Listing
      expect(listing.owner_id).to eq user.id
      expect(listing.name).to eq "test_name"
      expect(listing.price).to eq "$12.00"
      expect(listing.description).to eq "test_description"
    end
  end

  describe '.all' do
    it "returns a list of listings" do
      user1 = signup2
      user2 = signup2
      listing1 = Listing.create(owner_id: user1.id, name: 'test_1', description: '1_description', price: 10.00)
      listing2 = Listing.create(owner_id: user2.id, name: 'test_2', description: '2_description', price: 20.00)
      listings = Listing.all

      expect(listings[0]).to be_a Listing
      expect(listings[1]).to be_a Listing
      expect(listings.length).to eq 2
    end
  end

end
