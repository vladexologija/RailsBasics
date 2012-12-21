module UsersHelper
  def user_data(user)
    content_tag(:div, :class => "test") do
      tag(:img, {:src => image_path("rails.png")}) + tag(:br) + content_tag(:span, "User:#{user.username}") + tag(:br)
    end
  end

  def user_actions(user)
    content_tag(:tr, {:style => "background-color:#{cycle('pink','cyan','orange')}"}) do
      elements = [content_tag(:td, user.username)]
      elements << content_tag(:td, user.password)
      elements << content_tag(:td, user.preferences)
      elements << content_tag(:td, link_to('Show', user))
      elements << content_tag(:td, link_to('Edit', edit_user_path(user)))
      elements << content_tag(:td, link_to('Destroy', user, method: :delete, data: { confirm: 'Are you sure?' }))
      elements.join(' ').html_safe
    end

  end
end
