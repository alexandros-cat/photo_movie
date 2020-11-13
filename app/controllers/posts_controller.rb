class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if@post.valid? 
      @post.save
       redirect_to root_path
    else
       render 'new'
    end  
  end
end
