module UserSessionsHelper


	def sign_in(user)
		cookies.permanent[:remember_token]=user.remember_token
		self.current_user=user
	end


	def current_user=(user)
		@current_user=user
	end

	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	def current_user?(user)
		user == current_user
	end

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		self.current_user=nil
		cookies.delete(:remember_token)
	end

	def store_location
		session[:return_to]=request.url
	end

	def return_back_or(default)
		if session[:return_to]
			redirect_to session[:return_to]
			session.delete(:return_to)
		else
			redirect_to default
		end
	end

	def signed_in_user
	    unless signed_in?
	      store_location
	      redirect_to signin_path, notice: "Please sign in." 
	    end
  	end

  	def tag_color tag_id
  		@tag = Category.find_by_id(tag_id)
  		@tag.color
  	end


end
