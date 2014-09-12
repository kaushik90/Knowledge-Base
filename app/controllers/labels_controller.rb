class LabelsController < ApplicationController

	include UserSessionsHelper
	
	before_filter :signed_in_user

	def new
		@label = Category.new
	end

	def create
		@label = Category.new(params[:category])
		if @label.save
			flash[:success] = "New Lable is successfully created!"
      		redirect_to root_path
		else
			render 'new'
		end
	end

	def index
		@label = Category.all
	end

	def show
		@label = Category.find(params[:id])
	end

	def edit
		@label = Category.find(params[:id])
	end
end
