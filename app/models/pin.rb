class Pin < ActiveRecord::Base
	attr_accessible :description, :image, :image_remote_url
	has_attached_file :image

	validates :image, presence: true
	validates :description, presence: true
	validates :user_id, presence: true
	validates_attachment :image, presence: true,
								content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
								size: { less_than: 5.megabytes }
	belongs_to :user
			has_attached_file :image,
			#:storage => :dropbox,
			#:dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
			:styles => { :medium => "300x300>", :thumb => "100x100" }
			#:dropbox_options => {
      #	:path => proc { |style| "#{style}/#{id}_#{image.original_filename}" }
    	#}

	def image_remote_url=(url_value)
		self.image = URI.parse(url_value) unless url_value.blank?
		super
	end
end
