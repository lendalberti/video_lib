require 'rails_helper'

RSpec.describe Rule, :type => :model do
  
	it "Has a valid factory" do
    expect(FactoryGirl.create(:rule)).to be_valid
  end


  it "Is valid with a name, badge_name, video_name, and view_count " do
    expect(FactoryGirl.build(:rule, name: 'Rule1', badge_name: 'Badge1', video_name: 'Video1', view_count: 2)).to be_valid
  end


  it "Is invalid without a name" do
  	expect(FactoryGirl.build(:rule, name: nil)).to_not be_valid
  end

	it "Is invalid without a badge_name" do
  	expect(FactoryGirl.build(:rule, badge_name: nil)).to_not be_valid
  end

	it "Is invalid without a video_name" do
  	expect(FactoryGirl.build(:rule, video_name: nil)).to_not be_valid
  end

	it "Is invalid without a view_count" do
  	expect(FactoryGirl.build(:rule, view_count: nil)).to_not be_valid
  end

end





