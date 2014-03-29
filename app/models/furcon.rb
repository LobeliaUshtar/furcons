class Furcon < ActiveRecord::Base
	has_many :memberships, dependent: :destroy

	before_validation :generate_slug

	validates :name, presence: true, uniqueness: true
	validates :slug, uniqueness: true
	validates :website, :location, :starts_on, :ends_on, :prereg_by, presence: true
	validates :image_file_name, allow_blank: true, format: {
		with: /\w+.(gif|jpg|png)\z/i,
		message: "must reference a GIF, JPG, or PNG image"
	}

	scope :everything, -> { order(starts_on: :asc) }
	scope :upcoming, -> { where("starts_on >= ?", Time.now).order(starts_on: :asc) }
	scope :upcoming_prereg, -> { upcoming.where("prereg_by >= ?", Time.now).order(prereg_by: :asc) }
	scope :past, -> { where("starts_on < ?", Time.now).order(starts_on: :desc) }
	scope :recent, ->(r=3) { past.limit(r) }
	
	def charity?
		charities.blank?
	end

	def to_param
		slug
	end

	def generate_slug
		self.slug ||= name.parameterize if name
	end
end