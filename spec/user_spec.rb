require 'user'
require 'database_helpers'

describe User do

  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'test@example.com', password: 'password')

      persisted_data = persisted_data(id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.email).to eq 'test@example.com'
    end
  end
end
