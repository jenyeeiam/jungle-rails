require 'rails_helper'



RSpec.describe User, type: :model do

  before :each do
    @user = User.new(first_name: 'Jen', last_name: 'Yee', email: 'email@email.com', password_digest: 'aer3j2a')
  end

  it 'should validate presence of first_name' do
    @user.first_name = nil
    @user.save
    expect(@user.errors.size).to eq(1)
  end

  it 'should validate presence of last_name' do
    @user.last_name = nil
    @user.save
    expect(@user.errors.size).to eq(1)
  end

  it 'should validate presence of email' do
    @user.email = nil
    @user.save
    expect(@user.errors.size).to eq(1)
  end

  it 'should validate presence of password_digest' do
    @user.password_digest = nil
    @user.save
    expect(@user.password_digest).to_not be_present
  end

end
