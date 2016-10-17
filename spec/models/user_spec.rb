require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do
    @user = User.new(first_name: 'Jen', last_name: 'Yee', email: 'Email@email.com', password: 'aer3j2a', password_confirmation: 'aer3j2a')
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

  it 'should check for email uniqueness' do
    email = @user.email.downcase
    @user.update(email: email)
    @user.save
    @user2 = User.create(first_name: 'Billy', last_name: 'Goat', email: 'test@email.com', password_digest: 'aer3j2a')
    expect(@user.email).to_not eq(@user2.email)
  end

  it 'should confirm password and password_confirmation fields are present' do
    @user.password = nil
    @user.save
    expect(@user.password_digest).to_not be_present
  end

  it 'should confirm password and password_confirmation fields are equal' do
    @user2 = User.new(first_name: 'Jen', last_name: 'Yee', email: 'Email@email.com', password: 'aer3j2a', password_confirmation: 'Ber3j2a')
    expect(@user2.password).to_not eq(@user2.password_confirmation)
  end

  it 'should confirm that the password is a minimum length of 6 characters' do
    @user.password = "123456"
    expect(@user.password.length).to eq(6)
  end



end


# user1 = User.create(first_name: "Bob", last_name: "Joe", email: "email", password: "a", password_confirmation: "a")