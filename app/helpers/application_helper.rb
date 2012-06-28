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

end
