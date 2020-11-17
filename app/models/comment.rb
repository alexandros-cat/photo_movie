class Comment < ApplicationRecord
  belongs_to :post  # postテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
end
