class SecretNumbersController < ApplicationController
	def index
	end

	def show
		@chosen_number = params[:id].to_i
		@secret_number = rand(5) + 1
	end

end
