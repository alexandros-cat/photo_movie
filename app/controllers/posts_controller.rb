class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  
  def create
      post = Post.new(post_params)
    if post.valid? 
       post.save
       redirect_to home_posts_path
    else
       render 'new'
    end  
  end

  def post_params
    params.require(:post).permit(:title, :content, :category_id,:movie)
                                 .merge(user_id: current_user.id)
  end

end
