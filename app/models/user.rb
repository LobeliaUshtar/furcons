class User < ActiveRecord::Base
	before_validation :generate_slug

	has_secure_password
	
	validates :name, presence: true, uniqueness: true
	validates :slug, uniqueness: true
	validates :email, presence: true, format: /\A\S+@\S+\z/, uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 5, allow_blank: true }
	validates :username, presence: true, format: /\A[A-Z0-9]+\z/i, uniqueness: { case_sensitive: false }

	scope :by_name, -> { order(:name) }
	scope :not_admins, -> { by_name.where(admin: false) }
	
	def gravatar_id
		Digest::MD5::hexdigest(email.downcase)
	end

	def self.authenticate(email_or_username, password)
		user = User.find_by(email: email_or_username) || User.find_by(username: email_or_username)
		user && user.authenticate(password)
	end

	def to_param
		slug
	end

	def generate_slug
		self.slug ||= name.parameterize if name
	end

end