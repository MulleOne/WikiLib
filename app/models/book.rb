class Book < ActiveRecord::Base
	
	has_many :author_books, dependent: :destroy
	has_many :authors, :through => :author_books, dependent: :destroy 

	#attr_accessible :title, :summary
	has_attached_file :image, styles: { large: "600x600", medium: "300x300>", thumb: "150x150#" }, default_url: "/images/missing_image.png" #"/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	
	accepts_nested_attributes_for :authors, allow_destroy: true
	accepts_nested_attributes_for :author_books, allow_destroy: true

	validates :title, :presence => true, uniqueness: { scope: :author } #Unique names in the scope of a parent
	validates :image, :summary, :presence => true
end
