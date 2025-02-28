module ApplicationHelper

  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
    when :success
      "alert-success"   # for success messages
    when :alert, :error
      "alert-danger"    # for errors (e.g., wrong password)
    else
      "alert-info"      # for general informational messages
    end
  end

end
