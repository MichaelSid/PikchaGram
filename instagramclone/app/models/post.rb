class Post < ActiveRecord::Base
	validates :description, presence: true
	# validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	#resizes file to match dimensions. Saves storage space.
	has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" },
		storage: :s3,
    bucket: 'Instagram-Bucket-MS',
    s3_credentials: {
      access_key_id: Rails.application.secrets.s3_access_key,
      secret_access_key: Rails.application.secrets.s3_secret_key
    }
end
