FactoryGirl.define do
	
  factory :rule do
  	id		     Faker::Number.between(from = 1, to = 5) 
    name       Faker::Name.name
    badge_name Faker::Lorem.word
    video_name Faker::Lorem.word
    view_count Faker::Number.number(1) 
  end

end
