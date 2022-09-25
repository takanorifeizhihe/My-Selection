class Public::LikesController < ApplicationController

  def create
    @other_content = OtherContent.find(params[:other_content_id])
    @like = current_user.likes.new(other_content_id: @other_content.id)
    @like.save
    redirect_back(fallback_location: root_path)
  end

  def create_movie
    @movie = Movie.find(params[:movie_id])
    @like = current_user.likes.new(movie_id: @movie.id)
    @like.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @other_content = OtherContent.find(params[:other_content_id])
    @like = current_user.likes.find_by(other_content_id: @other_content.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

  def destroy_movie
    @movie = Movie.find(params[:movie_id])
    @like = current_user.likes.find_by(movie_id: @movie.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end


end
