class MoviesController < ApplicationController
	def index
		if params[:q].present?
			@movies = Movie.search_for(params[:q])
		else
			@movies = Movie.all.order("year_released DESC")
		end
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new(movie_params)
		if @movie.save
			redirect_to root_path
		else 
			render :new
		end
	end

	def show
		@movie = Movie.find(params[:id])
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])
		@movie.update(movie_params)

		redirect_to root_path
	end

	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy

		redirect_to root_path
	end


	private 

	def movie_params
		params.require(:movie).permit(:title, :description, :year_released)
	end
end
