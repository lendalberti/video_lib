FactoryGirl.define do
	
  factory :user do
  	id 				 1 
    name       Faker::Name.name
    company_id 1 
  end

end
