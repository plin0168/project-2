class Post < ActiveRecord::Base
  validates :image, presence: true

  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end

# add has_attached_file to post model after implementing paperclip gem
#run rails migration generator with 'rails g paperclip post image'
