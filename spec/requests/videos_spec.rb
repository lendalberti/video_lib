require 'rails_helper'

RSpec.describe "Videos", type: :request do

	before(:each) do
		@video       = FactoryGirl.create(:video)
		@first_video = Video.first
	end
  

  describe "GET /videos" do
    it "Renders index page" do    							# index
      get videos_path
      expect(response).to have_http_status(200)
    end
  end

	describe "GET /videos/new" do
		it "Renders new page" do    								# new
			get new_video_path
			expect(response).to render_template(:new)
		end
	end


	describe "GET /videos/:id/edit" do
		it "Renders edit page" do    								# edit
			get edit_video_path(@first_video)
			expect(response).to render_template(:edit)
		end
	end



	describe "GET /videos/:id" do
		it "Renders show page" do    								# show
			get video_path(@first_video)
			expect(response).to render_template(:show)
		end
	end


	describe "POST /videos" do
		it "creates a new Video" do    							# create
      expect {
        post '/videos', 
        	params: { 
        		:video => { 
        			:id => Faker::Number.between(from = 6, to = 10), 
        			:name => Faker::Name.name}  } 
      }.to change(Video, :count).by(1)
    end
  end


  describe "DELETE /videos/:id" do    					# destroy
  	it "Deletes a video" do
  	  expect do
    		delete video_path(@first_video)
      end.to change(Video, :count).by(-1)
	  end
  end


	describe "PATCH /videos/:id" do   					# update
		it "Updates a video" do
       expect {
       	patch video_path(@first_video.id),
       		params: {
       				  video: { 
       					   name: "Inigo Montoya" } }
      }.to change{ Video.first.name } 
		end
	end









end
