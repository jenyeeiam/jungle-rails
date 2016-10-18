require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

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
      expect(@user.password.length).to be >= 6
    end
  end

  describe '.authenticate_with_credentials' do

    before :each do
      @user = User.new(first_name: 'Jen', last_name: 'Yee', email: 'email@email.com', password: 'aer3j2a', password_confirmation: 'aer3j2a')
    end

    it 'should remove white spaces on the back or front of the user input' do
      @user2 = User.new(first_name: 'Jen', last_name: 'Yee', email: '      email@email.com', password: 'aer3j2a', password_confirmation: 'Ber3j2a')
      email = @user2.email.strip
      @user2.update(email: email)
      expect(@user.email).to eq(@user2.email)
    end

    it 'should be case-insensitive' do
      @user2 = User.new(first_name: 'Jen', last_name: 'Yee', email: 'EmaiL@email.com', password: 'aer3j2a', password_confirmation: 'Ber3j2a')
      email = @user2.email.downcase
      @user2.update(email: email)
      expect(@user.email).to eq(@user2.email)
    end
  end

end


