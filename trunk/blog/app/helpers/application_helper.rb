module ApplicationHelper

  def page_title(name)
    content_for(:title) { name }
    content_tag(:h1, name)
  end
end
