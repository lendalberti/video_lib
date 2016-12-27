require 'rails_helper'

RSpec.describe Company, :type => :model do
  
	it "Has a valid factory" do
    expect(FactoryGirl.create(:company)).to be_valid
  end

  it "Is valid with a name" do
  	expect(FactoryGirl.build(:badge, name: 'Badge-1')).to be_valid
  end


  it "Is invalid without a name" do
  	expect(FactoryGirl.build(:company, name: nil)).to_not be_valid
  end






end





