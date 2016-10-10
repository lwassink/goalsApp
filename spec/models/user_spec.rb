require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "validations" do
    user1 = User.new(username: "Tim")
    user1.password = "password"
    user1.save

    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:session_token) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_uniqueness_of(:username) }
  end

  describe "associations" do
    it { should have_many(:goals) }
    it { should have_many(:comments) }
  end

  describe "authentication" do
  end
end
