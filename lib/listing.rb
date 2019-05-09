# require 'pg'
# require_relative 'database_connection'
#
# class Listing
#   def self.all
#     if ENV['ENVIRONMENT'] == 'test'
#       connection = PG.connect(dbname: 'makersbnb_test')
#     else
#       connection = PG.connect(dbname: 'makersbnb')
#     end
#     listings = connection.exec('SELECT * FROM listings')
#     listings.map { |listing| listing['name'], listing['price'], listing['description'] }
#   end
#
#   def self.create(owner:, date:, name:, description:, price:)
#     if ENV['ENVIRONMENT'] == 'test'
#       connection = PG.connect(dbname: 'makersbnb_test')
#     else
#       connection = PG.connect(dbname: 'makersbnb')
#     end
#     result = connection.exec("INSERT INTO bookmarks (owner, date, name, description, price) VALUES ('#{owner}','#{date}','#{name}','#{description}','#{price}') RETURNING id, owner, date, name, description, price;")
#     Listing.new(id: result[0]['id'], owner: result[0]['owner'], date: result[0]['date'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'])
#   end
#
#   attr_reader :owner, :date, :name, :description, :price
#
#   def initialize(id:, owner:, date:, name:, description:, price:)
#     @id = id
#     @owner = owner
#     @date = date
#     @name = name
#     @description = description
#     @price = price
#   end
# end
