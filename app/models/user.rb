class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :posts   
  has_many :comments  # commentsテーブルとのアソシエーション
  has_many :sns_credentials
  has_many :likes
  has_many :favorites
  validates :nickname, presence: true
  validates :email, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  validates :password, presence: true, confirmation: true
  validates :nickname, presence: true, length: { maximum: 6 }
  
  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end

end
