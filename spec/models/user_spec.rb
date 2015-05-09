require 'rails_helper'

RSpec.describe User, type: :model do
  def valid_attributes(new_attributes = {})
    attributes = {first_name: "Diederik",
                  last_name: "Kroondijk", 
                  email: "dkroondijk@hotmail.com", 
                  password: "12341234"}
    attributes.merge(new_attributes)
  end

  describe "validations" do
    it "requires an email" do
      user = User.new(valid_attributes({email: nil}))
      expect(user).to be_invalid
    end

    it "requires a first name" do
      user = User.new(valid_attributes({first_name: nil}))
      expect(user).to be_invalid
    end

    it "requires a unique email" do
      User.create(valid_attributes)
      user = User.new(valid_attributes)
      user.save
      expect(user.errors.messages).to have_key(:email)
    end
  end
end
