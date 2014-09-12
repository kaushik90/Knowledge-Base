class ArticlesController < ApplicationController

 include UserSessionsHelper

 before_filter :signed_in_user
 before_filter :correct_user,   only: :destroy

	def new
		@article = current_user.articles.build
		tags = Category.all
		@STATUS = []
		tags.each do |t|
			i = []
			i << t.name
			i << t.id
			@STATUS << i
		end
	end

	def create
		@article = current_user.articles.build(params[:article])
		if @article.save
			flash[:success] = "your article is successfully created!"
      		redirect_to @article
		else
			render 'new'
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
		tags = Category.all
		@STATUS = []
		tags.each do |t|
			i = []
			i << t.name
			i << t.id
			@STATUS << i
		end
	end

	def update
		@article = Article.find(params[:id])
		if @article.update_attributes(params[:article])
			flash[:success] = "Article has been updated successfulyy!"
      		redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article.destroy
		flash[:success] = "your article is successfully deleted!"
    	redirect_to root_path
	end

	private

	def correct_user
      @article = current_user.articles.find_by_id(params[:id])
      redirect_to root_url if @article.nil?
    end
 
end
