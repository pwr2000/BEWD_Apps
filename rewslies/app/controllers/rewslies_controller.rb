class RewsliesController < ApplicationController

	before_action :authenticate_user!, :only => [:new, :create]

	def index
		if params[:q].present?
			@rewlies = Rewsly.search_for(params[:q])
		else
			@rewlies = Rewsly.all
		end
	end

	def show
		@rewsly = Rewsly.find(params[:id])
	end

	def new
		@rewsly = Rewsly.new
	end

	def create
		@rewsly = Rewsly.new(safe_params)
		if	@rewsly.save
			redirect_to root_path
		else
			render :new
		end

	end

	private

	def safe_params
		return params.require(:rewsly).permit(:title, :link, :upvotes, :category)
	end
end
