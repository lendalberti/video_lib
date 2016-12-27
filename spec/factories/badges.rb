FactoryGirl.define do

  factory :badge do
  	id        1
    name      Faker::Name.name
    fa_symbol Faker::Lorem.word
  end

end
