require 'rails_helper'

RSpec.describe Badge, :type => :model do
  
	it "Has a valid factory" do
    expect(FactoryGirl.create(:badge)).to be_valid
  end

  it "Is valid with a name and fa_symbol" do
  	expect(FactoryGirl.build(:badge, name: 'Badge-1', fa_symbol: 'Symbol-1' )).to be_valid
  end


  it "Is invalid without a name" do
  	expect(FactoryGirl.build(:badge, name: nil)).to_not be_valid
  end

	it "Is invalid without an fa_symbol" do
  	expect(FactoryGirl.build(:badge, fa_symbol: nil)).to_not be_valid
  end


end





