require "rails_helper"

RSpec.describe User, type: :model do
  describe "factory" do
    it "has a valid factory" do
      user = FactoryBot.build(:user)
      puts user.attributes
      #user.valid?.should be_truthy

      expect(user.valid?).to eq(true)
    end
  end

  describe "validations" do
    it "is invalid without a name" do
      user = FactoryBot.build(:user, name: nil)

      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a login" do
      user = FactoryBot.build(:user, login: nil)

      expect(user).not_to be_valid
      expect(user.errors[:login]).to include("can't be blank")
    end

    it "is invalid with a duplicated login" do
      role = FactoryBot.create(:role)
      userA = FactoryBot.create(:user, login: "lluc", role: role)

      user = FactoryBot.build(:user, login: userA.login, role: role)

      expect(user).not_to be_valid
      expect(user.errors[:login]).to include("has already been taken")
    end

    it "is invalid without a password" do
      user = FactoryBot.build(:user, password: nil, password_confirmation: nil)

      expect(user).not_to be_valid
      expect(user.errors[:password]).to be_present
    end

    it "is invalid when password confirmation does not match" do
      user = FactoryBot.build(:user, password: "password123", password_confirmation: "different")

      expect(user).not_to be_valid
      expect(user.errors[:password_confirmation]).to be_present
    end

    it "is invalid without a role" do
      user = FactoryBot.build(:user, role: nil)

      expect(user).not_to be_valid
      expect(user.errors[:role]).to be_present
    end
  end

  describe "associations" do
    it "belongs to a role" do
      role = FactoryBot.create(:role, code: "ADMIN", description: "Administrator")
      user = FactoryBot.create(:user, role: role)

      expect(user.role).to eq(role)
    end
  end

  describe "password authentication" do
    it "authenticates with the correct password" do
      user = FactoryBot.create(:user, password: "password123", password_confirmation: "password123")

      expect(user.authenticate("password123")).to eq(user)
    end

    it "does not authenticate with an incorrect password" do
      user = FactoryBot.create(:user, password: "password123", password_confirmation: "password123")

      expect(user.authenticate("wrongpassword")).to eq(false)
    end

    it "stores a password digest instead of the plain password" do
      user = FactoryBot.create(:user, password: "password123", password_confirmation: "password123")

      expect(user.password_digest).to be_present
      expect(user.password_digest).not_to eq("password123")
    end
  end
end