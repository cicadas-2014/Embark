module UserHelper

		def current_user
		if !session[:id].nil?
			@current_user = User.find(session[:id])
		else
			false
		end

	end
	
end
