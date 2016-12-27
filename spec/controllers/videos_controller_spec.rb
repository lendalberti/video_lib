require 'rails_helper'
describe "Get logged in, watch video, earn badge", :type => :feature do
  
  before :each do
    @rule    = FactoryGirl.create(:rule)
    @video   = FactoryGirl.create(:video)
    @company = FactoryGirl.create(:company)
    @user    = FactoryGirl.create(:user)
    @badge   = FactoryGirl.create(:badge)

    visit '/videos'
    click_on( @user.name ).click 
    expect(page).to have_content "Current Logged User is : #{@user.name}"

  end

  it "Click on watch video" do
  	#
  	# need to install 'capybara-webkit' in order 
  	# to really test javascript integration...
  	#
    click_on( 'play' ).click 
    expect(page).to have_content "Currently watching: '#{@video.name}'"

    click_on( 'Back' ).click 
    expect(page).to have_content "Listing videos"
  end


end

