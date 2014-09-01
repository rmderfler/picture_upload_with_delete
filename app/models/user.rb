class User < ActiveRecord::Base
	has_secure_password
	validates_uniqueness_of :name
	has_secure_password
  validates_presence_of :name
  has_many :photos
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
