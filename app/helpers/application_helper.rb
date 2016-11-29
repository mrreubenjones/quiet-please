module ApplicationHelper

  # Returns the website page title on a per-page basis.
  def site_title(page_title = '')
    base_title = "Quiet Please, the Silent Auction Application"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

end
