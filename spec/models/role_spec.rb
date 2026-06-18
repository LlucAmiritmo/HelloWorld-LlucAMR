require "rails_helper"

RSpec.describe Role, type: :model do
  describe "factory" do
    it "has a valid factory" do
      role = FactoryBot.build(:role)

      expect(role).to be_valid
    end
  end

  describe "validations" do
    it "is invalid without a code" do
      role = FactoryBot.build(:role, code: nil)

      expect(role).not_to be_valid
      expect(role.errors[:code]).to include("can't be blank")
    end

    it "is invalid without a description" do
      role = FactoryBot.build(:role, description: nil)

      expect(role).not_to be_valid
      expect(role.errors[:description]).to include("can't be blank")
    end

    it "is invalid with a duplicated code" do
      roleA = FactoryBot.create(:role, code: "ADMIN")
      role = FactoryBot.build(:role, code: roleA.code)

      expect(role).not_to be_valid
      expect(role.errors[:code]).to include("has already been taken")
    end
  end

  describe "boolean defaults" do
    it "sets admin to false when admin is not provided" do
      role = FactoryBot.build(:role)

      role.valid?

      expect(role.admin).to eq(false)
      expect(role.user).to eq(false)
    end

    it "sets user to false when user is not provided" do
      role = FactoryBot.build(:role)

      role.valid?

      expect(role.user).to eq(false)
    end

    it "sets admin to false when admin is nil" do
      role = FactoryBot.build(:role, admin: nil)

      role.valid?

      expect(role.admin).to eq(false)
      expect(role).to be_valid
    end

    it "sets user to false when user is nil" do
      role = FactoryBot.build(:role, user: nil)

      role.valid?

      expect(role.user).to eq(false)
      expect(role).to be_valid
    end
  end
end