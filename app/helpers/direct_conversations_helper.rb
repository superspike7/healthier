module DirectConversationsHelper

  def conversation_username_to_display(members)
    other = members.other_user(current_user)
    if members.not_the_passed_user(current_user).blank?
      current_user.username
    else
      other.username
    end
  end

  def conversation_avatar_to_display(members)
    other = members.other_user(current_user)
    if members.not_the_passed_user(current_user).blank?
      user_avatar(current_user, class: 'h-12 w-12 bg-green-200 rounded-full')
    else
      user_avatar(other, class: 'h-12 w-12 bg-green-200 rounded-full')
    end
  end
end
