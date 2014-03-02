class Furcon < ActiveRecord::Base
	validates :name, :website, :location, :starts_on, :ends_on, :prereg_by, presence: true
	validates :image_file_name, allow_blank: true, format: {
		with: /\w+.(gif|jpg|png)\z/i,
		message: "must reference a GIF, JPG, or PNG image"
	}

	has_many :memberships, dependent: :destroy
	
	def charity?
		charities.blank?
	end
	def self.ordered
		order(starts_on: :asc)
	end
end