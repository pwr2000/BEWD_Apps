class RockPaperScissorsController < ApplicationController
	def index
	end

	def show
		@user_pick = params[:id].to_i
		@computer_pick = rand(3) + 1
	end

end
