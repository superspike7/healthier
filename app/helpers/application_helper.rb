module ApplicationHelper
  def user_avatar(user, options = {})
    if user.avatar.attached?
      image_tag(user.avatar, options)
    else
      image_tag('default_profile.png', options)
    end
  end
end
