class UserSessionsController < ApplicationController

	include UserSessionsHelper

  	def new
  	end

	def create
		user = User.find_by_email(params[:user_session][:email])
		if user && user.authenticate(params[:user_session][:password])
			sign_in user
			return_back_or user
		else
			flash.now[:error] = "Invalid email/password combination. Please try again."
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
