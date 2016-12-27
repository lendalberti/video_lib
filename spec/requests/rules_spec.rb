
require 'rails_helper'

RSpec.describe "Rules", type: :request do

	before(:each) do
		@rule       = FactoryGirl.create(:rule)
		@first_rule = Rule.first
	end
  

  describe "GET /rules" do
    it "Renders index page" do    							# index
      get rules_path
      expect(response).to have_http_status(200)
    end
  end

	describe "GET /rules/new" do
		it "Renders new page" do    								# new
			get new_rule_path
			expect(response).to render_template(:new)
		end
	end


	describe "GET /rules/:id/edit" do
		it "Renders edit page" do    								# edit
			get edit_rule_path( @first_rule.id )
			expect(response).to render_template(:edit)
		end
	end


	describe "GET /rules/:id" do
		it "Renders show page" do    								# show
			get rule_path(@first_rule)
			expect(response).to render_template(:show)
		end
	end


	describe "POST /rules" do
		it "creates a new Rule" do    							# create
      expect {
        post rules_path,
        	params: { 
        		:rule => { 
        			:id         => Faker::Number.between(from = 6, to = 10), 
        			:name       => Faker::Name.name, 
        			:badge_name => Faker::Name.name, 
        			:video_name => Faker::Name.name, 
        			:view_count => Faker::Number.between(from = 1, to = 5) } }
      }.to change(Rule, :count).by(1)
    end
  end


  describe "DELETE /rules/:id" do    					# destroy
  	it "Deletes a rule" do
  	  expect do
    		delete rule_path(@first_rule)
      end.to change(Rule, :count).by(-1)
	  end
  end


	describe "PATCH /rules/:id" do   					# update
		it "Updates a rule" do
      expect {
       	patch rule_path(@first_rule.id),
       		params: {
       			rule: {
       				name: "Inigo Montoya" } }
      }.to change{Rule.first.name}


		end
	end



end
