require 'pg'

class User
  def self.create(email:, password:)
    encrypted_password = BCrypt::Password.create(password)

    if ENV["ENVIRONMENT"] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO users (email, password) VALUES ('#{email}', '#{encrypted_password}') RETURNING id, email;")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  attr_reader :id, :email

  def initialize(id: , email:)
    @id = id
    @email = email
  end

end
