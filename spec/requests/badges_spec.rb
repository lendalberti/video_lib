require 'rails_helper'

RSpec.describe "Badges", type: :request do

	before(:each) do
		@badge       = FactoryGirl.create(:badge)
		@first_badge = Badge.first
	end
  

  describe "GET /badges" do
    it "Renders index page" do    							# index
      get badges_path
      expect(response).to have_http_status(200)
    end
  end

	describe "GET /badges/new" do
		it "Renders new page" do    								# new
			get new_badge_path
			expect(response).to render_template(:new)
		end
	end


	describe "GET /badges/:id/edit" do
		it "Renders edit page" do    								# edit
			get edit_badge_path(@first_badge)
			expect(response).to render_template(:edit)
		end
	end



	describe "GET /badges/:id" do
		it "Renders show page" do    								# show
			get badge_path(@first_badge)
			expect(response).to render_template(:show)
		end
	end


	describe "POST /badges" do
		it "creates a new Badge" do    							# create
      expect {
        post  badges_path, 
        	params: { 
        		:badge => { 
        			:id => Faker::Number.number(5), 
        			:name => Faker::Name.name, 
        			:fa_symbol => Faker::Lorem.word}  } 
      }.to change(Badge, :count).by(1)
    end
  end


  describe "DELETE /badges/:id" do    					# destroy
  	it "Deletes a badge" do
  	  expect do
    		delete badge_path(@first_badge)
      end.to change(Badge, :count).by(-1)
	  end
  end


	describe "PATCH /badges/:id" do   					# update
		it "Updates a badge" do
      expect {
       	patch badge_path(@first_badge.id),
       		params: {
       			badge: {
       						name: "Special Badge of Honor" } }
      }.to change{Badge.first.name}

		end
	end



end
