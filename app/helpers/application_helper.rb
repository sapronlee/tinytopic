# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # return the formatted flash[:notice] html
  def notice_message(mark = :default, scroll = false)
    if flash[:notice_success]
      result = '<div id="success_message_'+mark.to_s+'" class="successMessage">'+flash[:notice_success]+'</div>'
    	if scroll == true
      	result += '<script type="text/javascript">
      	  $.scrollTo("#success_message_'+mark.to_s+'",200);</script>'
      end
    elsif flash[:notice_error]
      result = '<div id="error_message_'+mark.to_s+'" class="errorMessage">'+flash[:notice_error]+'</div>'
    	if scroll == true
        result += '<script type="text/javascript">$.scrollTo("#error_message_'+mark.to_s+'",200);</script>'
      end
    elsif flash[:notice_warring]
      result = '<div id="warring_message_'+mark.to_s+'" class="warringMessage">'+flash[:notice_warring]+'</div>'
    	if scroll == true
        result += '<script type="text/javascript">$.scrollTo("#warring_message_'+mark.to_s+'",200);</script>'
      end
    else
      result = ''
    end
    
    return result
  end

  # check current_user is item's owner
  def owner?(item)
    return false if @current_user.blank?
    return true if item.user_id == @current_user.id
    false
  end
end
