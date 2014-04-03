class Post < ActiveRecord::Base

		has_many :reviews

	def self.search(query)
        if query
             where('text LIKE ?', "%#{query}%")
        else
             all
        end
    end
end
