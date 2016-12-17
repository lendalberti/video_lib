class CompanyDecorator < RKit::Decorator::Base
  def infos
    "Currently working at #{ self }:"
  end
end
