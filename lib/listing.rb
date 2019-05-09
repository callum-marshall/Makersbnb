require 'pg'
require_relative 'database_connection'

class Listing
  def self.all
    results = DatabaseConnection.query('SELECT * FROM listings')
    results.values.map do |result|
      Listing.new(id: result[0], owner_id: result[1], name: result[3], description: result[2], price: result[4])
    end
  end

  def self.create(owner_id:, name:, description:, price:)
    result = DatabaseConnection.query("INSERT INTO listings (owner_id, name, description, price) VALUES ('#{owner_id}','#{name}','#{description}','#{price}') RETURNING id, owner_id, name, description, price;")
    Listing.new(id: result[0]['id'], owner_id: result[0]['owner_id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'])
  end

  attr_reader :owner_id, :name, :description, :price

  def initialize(id:, owner_id:, name:, description:, price:)
    @id = id
    @owner_id = owner_id
    @name = name
    @description = description
    @price = price
  end
end

# listings (id SERIAL PRIMARY KEY, owner_id int NOT NULL,
#           description TEXT, name TEXT, price money)
