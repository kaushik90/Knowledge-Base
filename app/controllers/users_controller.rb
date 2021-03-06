class UsersController < ApplicationController

include UserSessionsHelper

before_filter :signed_in_user, only: [:edit, :update]
before_filter :correct_user,   only: [:edit, :update]

	def new
		@user = User.new
	end


	def create
		@user = User.new(params[:user])
		if @user.save
			sign_in @user
			flash[:success] = "Welcome to the Sample App!"
      		redirect_to @user
		else
			render 'new'
		end
	end


	def show
		@user = User.find(params[:id])
		@articles = @user.articles.paginate(page: params[:page])
		@tag = Category.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			sign_in @user
			flash[:success] = "Your profile has been updated successfulyy!"
      		redirect_to @user
		else
			render 'edit'
		end
	end


	private

	def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

	def correct_user
		user = User.find(params[:id])
		redirect_to root_url unless current_user?(user)
	end
end
