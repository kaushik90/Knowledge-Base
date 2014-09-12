class StaticPagesController < ApplicationController

include SearchHelper

	def home
		@articles = Article.paginate(page: params[:page])
		@tag = Category.all
	end


	def filter_article
		#@myquery = "SELECT * FROM articles WHERE title LIKE '%%#{params[:q]}%%'"
	#	@articles = ComplexQueries.my_query(@myquery)
		@articles = Article.where("title LIKE ?", "%#{params[:q]}%")
	end

end
