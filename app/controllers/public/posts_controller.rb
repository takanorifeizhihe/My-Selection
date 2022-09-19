class Public::PostsController < ApplicationController


  def index
    @post = Post.new
    @posts = Post.all

  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@other_content.id)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
    #if @post.save
     # redirect_to posts_path, notice: "You have created book successfully."
    #else
      @posts = Post.all
     # render 'index'
    #end
  end

  def edit
  end

  def post_params
    params.require(:post).permit(:user_id, :movie_id, :other_content_id, :star, :comment)
  end


end
