module CompaniesHelper

  def get_company_badges(co)
  	tmp    = []
  	badges = []

  	co.users.each do |u| 
  		u.badges.each do |b| 
  			tmp.push( b.name )
  		end 
  	end

  	tmp.uniq.each do |b| 
  		badges.push( Badge.find_by(:name => b).fa_symbol )
  	end

  	return badges
  end
  
end
