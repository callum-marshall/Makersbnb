require 'user'

describe User do

  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'test@example.com', password: 'password')
      expect(user).to be_a User
    end
  end
end
