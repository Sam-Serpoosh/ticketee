module ApplicationHelper

  def title(*parts)
    @main_title = "Ticketee"
    if parts.empty? == false
      @main_title = (parts << @main_title).join(" - ")
    end

    @main_title
  end
  
  def main_title
    @main_title ||= "Ticketee"
  end

  def admins_only(&block)
    block.call if current_user.try(:admin?)
    nil
  end

  def authorized?(permission, thing, &block)
    block.call if current_user.try(:admin?) || can?(permission.to_sym, thing)
    nil
  end

end
