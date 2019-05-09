require 'pg'

p "Setting up test database..."

def setup_test_database
  connection = PG.connect(dbname: 'makersbnb_test')

  # Clears the table every time you run the script
  connection.exec("TRUNCATE users, listings;")
end
