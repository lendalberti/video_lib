module ApplicationHelper
  def btn_to text, link
    link_to text, link, class: :btn
  end

  def pDebug(p)
    logger.info "\nDEBUG #{'⟱ '*50} DEBUG\n\n #{caller[0].inspect} \n"
    logger.debug p.to_yaml
    logger.info  "DEBUG #{'⟰ '*50} DEBUG\n"
  end


end
