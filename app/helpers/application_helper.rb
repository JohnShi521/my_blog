module ApplicationHelper

  def is_active_controller(controller_name)
    params[:controller] == controller_name ? true : false
  end

  def is_active_action(controller_name,action_name)
    params[:controller] == controller_name && params[:action] == action_name ? "active" : nil
  end
end
