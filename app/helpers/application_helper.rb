module ApplicationHelper
  def admin?
    User.find(session[:user_id]).admin?
  end
end
