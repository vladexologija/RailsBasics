module ApplicationHelper

  def page_title(name)
    content_for(:title) { name }
    content_tag(:h1, name)
  end

  def display_for(role)
    yield if current_user.in_role?(role)
  end

end
