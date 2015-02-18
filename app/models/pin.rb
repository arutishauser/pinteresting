class Pin < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, 
            :style => { :medium => "300x300>", :thumb => "100x100>" },
            :default_url => "https://rutishauser.amazons3.com/:style/missing.png"
            :storage => :s3,
            :bucket  => ENV['rutishauser']
	validates :image, presence: true
	validates :description, presence: true
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]  
end
