class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts   
  has_many :comments  # commentsテーブルとのアソシエーション
  has_many :likes
  has_many :favorites
  validates :nickname, presence: true
  validates :email, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  validates :password, presence: true, confirmation: true
  validates :nickname, presence: true, length: { maximum: 6 }
  
  
  
  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end

end
