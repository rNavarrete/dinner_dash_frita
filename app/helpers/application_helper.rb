module ApplicationHelper
  def admin?
    session[:user_id] ? User.find(session[:user_id]).admin? : false
  end
end
