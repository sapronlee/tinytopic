# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # check current_user is item's owner
  def owner?(item)
    return false if @current_user.blank?
    return true if item.user_id == @current_user.id
    false
  end
end
