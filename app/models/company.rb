class Company < ActiveRecord::Base
	acts_as_decorables
	
  has_many :users

  def to_s
    name
  end
end
