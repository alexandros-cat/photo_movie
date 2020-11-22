class PostsController < ApplicationController

  before_action :set_post, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  
  def create
      @post = Post.new(post_params)
    if @post.valid? 
       @post.save
       redirect_to posts_path
    else
      render 'new'
    end  
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end
  
  def edit
    
  end
  
  def update
  
    if @post.update(post_params)
       redirect_to posts_path
    else
       render 'edit'
    end 
  end  

  def destroy
    if @post.destroy
       redirect_to posts_path
    else
       render 'show'
    end
  end  
  
  def checked
  
    post = Post.find(params[:id])
    if post.checked
      post.update(checked: false)
    else
      post.update(checked: true)
    end
    post = Post.find(params[:id])
    render json: { Post: post }
  end

  

  def search
    @posts = Post.search(params[:keyword])
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :content, :category_id,:movie)
                                 .merge(user_id: current_user.id)
  end

  def set_post                       
    @post = Post.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
end
