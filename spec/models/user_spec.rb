require 'rails_helper'

RSpec.describe User, type: :model do




  context "Validations" do

    it "has all valid properties " do
      @user = User.create(firstname:"Alex", lastname: "Lock", email: "alex@lock.com",
                          password:"123456", password_confirmation: "123456")
      @user.validate!
      @user.errors.full_messages
    end

    it "must have a firstname" do
      @user = User.create(firstname: nil, lastname: "Lock", email: "alex@lock.com",
                          password:"123456", password_confirmation: "123456")

         expect(@user).to_not be_valid
         expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end

    it "must have lastname" do
      @user = User.create(firstname:"Alex", lastname: nil, email: "alex@lock.com",
                          password:"123456", password_confirmation: "123456")

         expect(@user).to_not be_valid
         expect(@user.errors.full_messages).to include("Lastname can't be blank")
    end

     it "must have a email" do
        @user = User.create(firstname:"Alex", lastname: "Lock", email: nil,
                          password:"123456", password_confirmation: "123456")
         expect(@user).to_not be_valid
         expect(@user.errors.full_messages).to include("Email can't be blank")
     end


      it "must have unique email" do

        @user1 = User.create(firstname:"Alex", lastname: "Lock", email: "alex@lock.com",
                          password:"123456", password_confirmation: "123456")
        @user2 = User.create(firstname:"Bob", lastname: "Lock", email: "alex@lock.com",
                          password:"123456", password_confirmation: "123456")

        expect(@user2.errors.messages[:email]).to eq ["has already been taken"]

      end







      xit "must have a password" do

         expect(@user).to_not be_valid
         expect(@user.errors.full_messages).to include("Password can't be blank")
    end

     xit "must have a password confirmation" do

         expect(@user).to_not be_valid
         expect(@user.errors.full_messages).to include("PasswordConfiramtion can't be blank")
    end

  end


end
