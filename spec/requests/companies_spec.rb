require 'rails_helper'

RSpec.describe "Companies", type: :request do

	before(:each) do
		@company       = FactoryGirl.create(:company)
		@first_company = Company.first
	end
  

  describe "GET /companies" do
    it "Renders index page" do    							# index
      get companies_path
      expect(response).to have_http_status(200)
    end
  end

	describe "GET /companies/new" do
		it "Renders new page" do    								# new
			get new_company_path
			expect(response).to render_template(:new)
		end
	end


	describe "GET /companies/:id/edit" do
		it "Renders edit page" do    								# edit
			get edit_company_path(@first_company)
			expect(response).to render_template(:edit)
		end
	end



	describe "GET /companies/:id" do
		it "Renders show page" do    								# show
			get company_path(@first_company)
			expect(response).to render_template(:show)
		end
	end


	describe "POST /companies" do
		it "creates a new Company" do    							# create
      expect {
        post  companies_path, 
        	params: { 
        		:company => { 
        			:id => Faker::Number.between(from = 6, to = 10), 
        			:name => Faker::Name.name}  } 
      }.to change(Company, :count).by(1)
    end
  end


  describe "DELETE /companies/:id" do    					# destroy
  	it "Deletes a company" do
  	  expect do
    		delete company_path(@first_company)
      end.to change(Company, :count).by(-1)
	  end
  end


	describe "PATCH /companies/:id" do   					# update
		it "Updates a company" do
      expect {
       	patch company_path(@first_company.id),
       		params: {
       			company: {
       						name: "HAL" } }
      }.to change{Company.first.name}
		end
	end



end
