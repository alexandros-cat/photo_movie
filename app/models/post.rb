class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to :user
  mount_uploader :movie, MovieUploader

  with_options presence: true do
    validates :movie
    validates :title
    validates :content
  end

  with_options numericality: { other_than: 1 } do
  validates :category_id
  end  

  def self.search(search)
    if search != ""
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
