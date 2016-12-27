require 'rails_helper'

RSpec.describe User, :type => :model do

  before :each do
    FactoryGirl.create(:company, :id => 5)
  end

  it "Is valid with a name, and company_id" do
    expect(FactoryGirl.build(:user, name: 'Badge-1', company_id: 2)).to be_valid
  end

	it "Has a valid factory" do
    expect(FactoryGirl.create(:user, :company_id => 5)).to be_valid
  end

  it "Is invalid without a name" do
  	expect(FactoryGirl.build(:user, name: nil)).to_not be_valid
  end

  it "Returns a user's full name as a string" do
  	user = FactoryGirl.create(:user, name: "John Doe", :company_id => 5)
	  expect(user.name) == "John Doe"
	end







end