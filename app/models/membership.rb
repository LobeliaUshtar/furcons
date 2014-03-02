class Membership < ActiveRecord::Base
	belongs_to :furcon

	validates :name, :prereg_fee, :reg_fee, presence: true
	validate :swag, allow_blank: true

	def prna?
		prereg_fee <= 0
	end
end