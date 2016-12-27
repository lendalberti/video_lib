require 'rails_helper'

RSpec.describe Video, :type => :model do
  
	it "Has a valid factory" do
    expect(FactoryGirl.create(:video)).to be_valid
  end


  it "Is valid with a name" do
    expect(FactoryGirl.build(:video, name: 'NewVideo1')).to be_valid
  end

  it "Is invalid without a name" do
  	expect(FactoryGirl.build(:video, name: nil)).to_not be_valid
  end


end





