class AuthorsController < ApplicationController
	
	#contant for displaying list of Authors from the Russian Alphabet
	RUSS_alph = ['А', 'Б', 'В', 'Г', 'Д', 'Е', 'Ё', 'Ж', 'З', 'И', 'Й', 
		         'К', 'Л', 'М', 'Н', 'О', 'П', 'Р', 'С', 'Т', 'У', 'Ф', 
		         'Х', 'Ц', 'Ч', 'Ш', 'Щ', 'Ъ', 'Ы', 'Ь', 'Э', 'Ю', 'Я']
	LAT_alph = ("A".."Z").to_a
	
	def index
		@books = Book.all
		@authors = Author.all
	end

	def list
		@books = Book.all
		@authors = Array.new
		Author.all.each do |author|
			temp = author.first_name.capitalize
			if  (params[:letter] == temp[0]) 
				@authors << author
			end
		end
		if (@authors.count >= 1)
			@found = true
		end
	end

	def create

	end

	def new

	end

	def edit

	end

	def update

	end

	def destroy

	end

	private 
	def author_params
		params.require(:author).permit(:first_name, :last_name, :author_books_id, :letter)
	end
end
