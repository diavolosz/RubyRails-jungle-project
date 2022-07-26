require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'General Validations' do

    before :each do
      @user = User.new( 
        first_name: "test",
        last_name: "user",
        email: "testuser123098@gmail.com",
        password: "123456789test",
        password_confirmation: "123456789test"
      )
    end

    it 'validates the first_name is present' do
      @user.first_name = nil
      @user.save
      expect(@user.errors.full_messages[0]).to eq("First name can't be blank") 
    end

    it 'validates the last_name is present' do
      @user.last_name = nil
      @user.save
      expect(@user.errors.full_messages[0]).to eq("Last name can't be blank") 
    end

    it 'validates the email is present' do
      @user.email = nil
      @user.save
      expect(@user.errors.full_messages[0]).to eq("Email can't be blank") 
    end

    it 'validates the password has a minimum length of 8 characters' do
      @user.password = "pass123"
      @user.password_confirmation = "pass123"
      @user.save
      expect(@user.errors.full_messages[0]).to eq("Password is too short (minimum is 8 characters)") 
    end

    it 'validates the password and password_confirmation fields match' do
      @user.password = "dave1234"
      @user.password_confirmation = "dave5432"
      @user.save
      expect(@user.errors.full_messages[0]).to eq("Password confirmation doesn't match Password") 
    end

    it 'validates the password_confirmation exist' do
      @user.password = "dave1234"
      @user.password_confirmation = nil
      @user.save
      expect(@user.errors.full_messages[0]).to eq("Password confirmation can't be blank") 
    end

    it 'validates the password exist' do
      @user.password = nil
      @user.password_confirmation = "dave1234"
      @user.save
      expect(@user.errors.full_messages[0]).to eq("Password can't be blank") 
    end
  end


  describe 'testing the authenticate_with_credentials' do

    before :each do
      @user = User.new( 
        first_name: "test",
        last_name: "user",
        email: "testuser123098@gmail.com",
        password: "123456789test",
        password_confirmation: "123456789test"
      )
    end

    it 'should return nil user if password doesnt match' do
      @user.save
      user = User.authenticate_with_credentials("testuser123098@gmail.com", "wrongpassword")
      expect(user).to be(nil)
    end

    it 'should return nil user if email is not found' do
      @user.save
      user = User.authenticate_with_credentials("notatestuser@gmail.com", "wrongpassword")
      expect(user).to be(nil)
    end

    it 'should return user if password matches' do
      @user.save
      user = User.authenticate_with_credentials("testuser123098@gmail.com", "123456789test")
      expect(user).to be_a(User)
    end

    it 'should return user if email contains whitespace' do
      @user.save
      user = User.authenticate_with_credentials("  testuser123098@gmail.com  ", "123456789test")
      expect(user).to be_a(User)
    end

    it 'should return user if email contains upper case letters' do
      @user.save
      user = User.authenticate_with_credentials("testUSER123098@gmail.com", "123456789test")
      expect(user).to be_a(User)
    end

  end
end