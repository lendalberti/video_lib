class Company < ActiveRecord::Base
	acts_as_decorables
	
  has_many :users
	validates_presence_of 	:name

  def to_s
    name
  end
end
