require 'rails_helper'

describe User do
  fixtures :users

  let(:password) { 'password' }

  it 'requires an email to be valid' do
    user = users :louis

    user.email = nil
    expect(user).not_to be_valid
    user.email = ''
    expect(user).not_to be_valid

    user.email = 'tom@email.uk'
    expect(user).to be_valid
  end

  it 'requires a password to be valid' do
    user = User.new
    user.email = 'something@something.com'

    expect(user).not_to be_valid
    user.password = password
    expect(user).to be_valid
  end
end
