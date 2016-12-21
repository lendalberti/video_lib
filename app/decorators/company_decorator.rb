class CompanyDecorator < RKit::Decorator::Base

  def employees
    "#{ self } Employees:"
  end

end
