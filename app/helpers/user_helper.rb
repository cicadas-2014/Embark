module UserHelper

	def current_user
		if session[:id] && User.(session[:id]).exist?
			@current_user = User.find(session[:id])
		else
			false
		end

	end
	def logged_in?
		if session[:id] && User.(session[:id]).exist?
			true
		else
			false
		end

	end
	
end
