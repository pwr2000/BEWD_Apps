class ShirtsController < ApplicationController
	def index
		#query the database for all the rows in the shirts table
		#return items as array
		#use @shirts as variable

		@shirts = Shirt.all
		
	end
end
