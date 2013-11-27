class Movie < ActiveRecord::Base
	validates :title, :description, :year_released, :presence => true
	validates :year_released, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }

	before_save :fill_poster

	def self.search_for ( query )
		Movie.where("title LIKE :query OR description LIKE :query", 
								:query => "%#{query}%")
	end

	def fill_poster
		title = URI::encode(self.title)
		omdb_json = RestClient.get("http://www.omdbapi.com/?i=&t=#{title}")
		omdb_movie = JSON.load(omdb_json)
		self.poster = omdb_movie["Poster"]
	end

end
