class CategoriesController < ApplicationController
	def index
		@categories = Category.all
	end

	def show
		@classifieds = Classified.where(category_id="#{params[:id]}")
	end
end
