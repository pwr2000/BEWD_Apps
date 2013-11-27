class Rewsly < ActiveRecord::Base
	validates :title, :link, :upvotes, :category, :presence => true
	validates :upvotes, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }

	def self.search_for ( query )
		Rewsly.where("title LIKE :query OR category LIKE :query",
			:query => "%#{query}%" )
	end
end
