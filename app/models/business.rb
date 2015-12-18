class Business < ActiveRecord::Base
	belongs_to :user
	has_many :locations, dependent: :destroy

	# for paperclip attachment 
  	has_attached_file :image
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
	validates_presence_of :name, :category

	accepts_nested_attributes_for :locations, reject_if: :all_blank, allow_destroy: true

	validate :check_location

	# Business must have at least one location
	def check_location
		if locations.empty? or locations.all? {|location| location.marked_for_destruction? }
	      errors.add(:base, 'Business must have at least one location')
	    end
	end
end