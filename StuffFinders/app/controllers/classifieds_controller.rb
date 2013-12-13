class ClassifiedsController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]

	def index
		@classifieds = Classified.all
		@categories = Category.all
	end

	def new
		@classified = Classified.new
		@categories = Category.pluck(:name)
	end

	def create
		@classified = Classified.new(classified_params)
		@classified.user = current_user

		@category = params[:category]
		@classified.category = Category.where(:name => @category.capitalize).first_or_create

		@categories = Category.pluck(:name)

		    if @classified.save
                redirect_to root_path
            else 
                render :new
            end
	end

	def show
		@classified = Classified.find(params[:id])
	end

	def destroy
		@classified = Classified.find(params[:id])
		@classified.destroy

		redirect_to root_path
	end	

	def edit
		@classified = Classified.find(params[:id])
	end

	def update
		@classified = Classified.find(params[:id])
		@classified.update(classified_params)

		redirect_to root_path
	end

	private

	def classified_params
		params.require(:classified).permit(:category, :title, :description, :price, :image)
	end
end
