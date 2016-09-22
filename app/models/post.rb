class Post < ActiveRecord::Base
  validates :image, presence: true
  belongs_to :user
  has_many :votes
  has_attached_file :image, styles: { :medium => "640x" },
                    default_url: "/images/:style/missing.png",
                    :storage => :s3,
                     url: ":s3_domain_url",
                     path: "/:class/:attachment/:id_partition/:style/:filename",
                     s3_region: 'us-west-1',
                     :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

 def s3_credentials
   {
     :bucket => ENV["S3_BUCKET_NAME"],
     :access_key_id => ENV["S3_ACCESS_KEY_ID"],
     :secret_access_key => ENV["S3_SECRET_ACCESS_KEY"]
   }
 end
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
