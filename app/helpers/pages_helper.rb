module PagesHelper
	def verify_admin
   	if session[:user_id].nil?
   		redirect_to root_path
    	elsif User.find(session[:user_id]).admin?
  		else
  				redirect_to root_path
    	end
 	end
end