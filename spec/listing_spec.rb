require 'listing'

describe Listing do

  describe '.create' do
    it "creates a new listing" do
      listing = Listing.create(owner_id: 1234, name: 'test_name', description: 'test_description', price: 12.00)

      expect(listing).to be_a Listing
      expect(listing.owner_id).to eq "1234"
      expect(listing.name).to eq "test_name"
      expect(listing.price).to eq "$12.00"
      expect(listing.description).to eq "test_description"
    end
  end

  # describe '.all' do
  #   it "returns a list of listings" do
  #     listing = Listing.create(owner_id: 1234, name: 'test_name', description: 'test_description', price: 12.00)
  #     listing.all
  #
  #
  #
  #   end
  # end

end
