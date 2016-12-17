class VideoDecorator < RKit::Decorator::Base

  def display
    "Currently watching: '#{ name }'"
  end

end
