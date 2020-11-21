class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @nickname = current_user.nickname
    @posts = current_user.posts.order('created_at DESC')
    @favorites = Favorite.all
    favorite = Favorite.where(user_id: current_user.id).select('post_id')
    @f_posts = Post.all.order('created_at DESC').where(id: favorite)  
  end
end
