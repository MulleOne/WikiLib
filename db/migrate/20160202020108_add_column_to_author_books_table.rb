class AddColumnToAuthorBooksTable < ActiveRecord::Migration
  def change
  	add_column :author_books, :author_id, :integer
  	add_column :author_books, :book_id, :integer
  end
end
