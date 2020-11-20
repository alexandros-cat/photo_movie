class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @nickname = current_user.nickname
    # お気に入り
    favorite = Favorite.where(user_id: current_user.id).select('post_id')
    
    

    # /お気に入り
  end
end
