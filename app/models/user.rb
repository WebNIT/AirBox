class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" },
    :default_url => "/images/:style/missing.png",
    :url  => ":s3_domain_url",
    :path => "public/avatars/:id/:style_:basename.:extension",
    :storage => :fog,
    :fog_credentials => {
        provider: 'AWS',
        aws_access_key_id: "AKIAICP3USVGHEURZY6Q",
        aws_secret_access_key: "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"
    },
    fog_directory: "rails-demo-env"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

    def full_name
      if self.name.blank?
        self.email
      else
        self.name
      end
    end

end
