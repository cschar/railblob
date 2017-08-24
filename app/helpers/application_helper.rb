module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "frzb"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
    #<% provide(:title, 'Contact') %> in template...
    # title --> page_title here,.. rails magic!
  end
end