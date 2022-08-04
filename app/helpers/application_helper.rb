module ApplicationHelper
  def user_avatar(user)
    width = '64'
    height = '64'
    if user.avatar.attached?
      image_tag(user.avatar, width:, height:)
    else
      image_tag('default_profile.png', width:, height:)
    end
  end
end
