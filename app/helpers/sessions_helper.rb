module SessionsHelper
  def current_manager
    Manager.find(session[:manager_id]) if session[:manager_id]
  end

  def logged_in?
    session[:manager_id].present?
  end
end
