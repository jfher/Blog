class Post < ActiveRecord::Base

		has_many :reviews

    def self.search (query)
        if query
             where('text LIKE :s OR category LIKE :s', :s =>  "%#{query}%")
        else
             all
        end
    end
end
