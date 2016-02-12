class BooksController < ApplicationController
	before_action :find_book, only: [:show, :edit, :update, :destroy]

	def index
		@books = Book.all
	end
	
	def new
		@book = Book.new
		@book.authors.build
	end
	
	def create
		@book =  Book.new(book_params)
		if @book.save
			redirect_to @book, notice: 'Successfully added a book.'
		else
			render 'index'
		end
	end
	
	def show
	end
	
	def update
		#@book_to_edit = Book.new(book_params)
		#@book.authors = @book_to_edit.authors
		#Mo need for finding the book, the before action a-top does it for us!
		if @book.update(book_params)
			redirect_to @book, notice: 'Successfully updated the book!'
		else
			render 'edit'
		end
	end
	
	def edit
	end
	
	def destroy
		@book.destroy
			redirect_to books_url, notice: 'Successfully deleted the book.'
	end
	
	def summaries
	end


	def authors_book_list	
		@books = Array.new
		params[:authors_book_list].each do |_book|
			Book.all.each do |book|
				if (_book.to_i == book.id)
					@books << book
				end
			end
		end
	end

	private 

	def book_params
		params.require(:book).permit(:title, :summary, :authors_book_list, :image, authors_attributes: [ :first_name, :last_name ])
	end

	def find_book
		@book = Book.find(params[:id])
	end

	def copy_data(from, to)
	end
end
