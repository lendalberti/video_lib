require 'rails_helper'

RSpec.describe "Users", type: :request do

	before(:each) do
		@company    = FactoryGirl.create(:company)
		@user       = FactoryGirl.create(:user)
		@first_user = User.first
	end
  

  describe "GET /users" do
    it "Renders index page" do    							# index
      get users_path
      expect(response).to have_http_status(200)
    end
  end

	describe "GET /users/new" do
		it "Renders new page" do    								# new
			get new_user_path
			expect(response).to render_template(:new)
		end
	end


	describe "GET /users/:id/edit" do
		it "Renders edit page" do    								# edit
			get edit_user_path( @first_user.id )
			expect(response).to render_template(:edit)
		end
	end


	describe "GET /users/:id" do
		it "Renders show page" do    								# show
			get user_path(@first_user)
			expect(response).to render_template(:show)
		end
	end

	describe "POST /users" do
		it "creates a new User" do    							# create
			expect { 
				post users_path, 
					params: { 
							user: { 
								id:(@user.id) + 1, 
								name: 'HAL', 
								company_id: 1 } }
			}.to change(User, :count).by(1)
    end
  end


  describe "DELETE /users/:id" do    					# destroy
  	it "Deletes a user" do
  	  expect do
    		delete user_path(@first_user)
      end.to change(User, :count).by(-1)
	  end
  end


	describe "PATCH /users/:id" do   					# update
		it "Updates a user" do
      expect {
       	patch user_path(@first_user.id),
       			params: {
       				user: { 
       					name: "Inigo Montoya" } }
      }.to change{ User.first.name } 
		end
	end



end
