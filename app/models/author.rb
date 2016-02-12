class Author < ActiveRecord::Base

	has_many :author_books
	has_many :books, :through => :author_books

	validates :first_name, :last_name, :presence => true

end
