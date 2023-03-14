require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before :each do
      @user1 = User.create(first_name: "Brandon", last_name: "Ha", email: "test@test.COM", password: "password", password_confirmation: "password")
    end
    it 'should validate password to not be the same as password confirmation' do
      @user1.password_confirmation = "password2"
      @user1.save
      expect(@user1.errors.full_messages).to include("Password confirmation doesn't match Password")
      expect(@user1.password).to_not eq(@user1.password_confirmation)
    end
    it 'should validate password and password confirmation to be present' do
      expect(@user1.password).to_not be_nil
      expect(@user1.password_confirmation).to_not be_nil
    end
    it 'should validate email to be unique' do
      newUser = User.create(first_name: "Jacob", last_name: "cob", email: "TEST@TEST.com", password: "password", password_confirmation: "password")
      expect(newUser).to_not be_valid
      expect(newUser.errors.full_messages).to include("Email has already been taken")
    end
    it 'should validate email to not be present' do
      @user1.email = nil
      @user1.save
      expect(@user1.email).to_not be_present
      expect(@user1.errors.full_messages).to include("Email can't be blank")
    end
    it 'should validate last name to not be present' do
      @user1.last_name = nil
      @user1.save
      expect(@user1.last_name).to_not be_present
      expect(@user1.errors.full_messages).to include("Last name can't be blank")
    end
    it 'should validate first name to not be present' do
      @user1.first_name = nil
      @user1.save
      expect(@user1.first_name).to_not be_present
      expect(@user1.errors.full_messages).to include("First name can't be blank")
    end
    it 'should validate password to not be less than the minimum length' do
      @user1.password = "pa"
      @user1.save
      expect(@user1.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end
  end
  describe '.authenticate_with_credentials' do
    before :each do
      @user1 = User.create(first_name: "Brandon", last_name: "Ha", email: "eXample@domain.COM", password: "password", password_confirmation: "password")
    end
    # examples for this class method here
    it 'should validate email with spaces around to still work' do
      expect(User.authenticate_with_credentials(" eXample@domain.COM  ", "password").email).to eq("eXample@domain.COM")
    end
    it 'should validate wrong case for email to be authenticated successfully' do
      expect(User.authenticate_with_credentials("EXAMPLe@DOMAIN.CoM", "password").email).to eq("eXample@domain.COM")
    end
  end
end
