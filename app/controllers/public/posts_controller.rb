class Public::PostsController < ApplicationController
  
  
  def index
    @post = Post.new
    @posts = Post.all 

  end
  
  def update
  end
  
  def show
  end
  
  def destroy
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end
  
  def edit
  end
    
  def post_params
    params.require(:post).permit(:title, :image, :release_date)
  end
  
  
end
