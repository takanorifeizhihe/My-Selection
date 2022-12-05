class Admin::ReviewsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def destroy
    @movie = Movie.find(params[:movie_id])
    @review = current_user.reviews.find_by(movie_id: @movie.id)
    @review.destroy
    redirect_back(fallback_location: root_path)
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = current_user.reviews.new(review_params)
    @review.movie_id = @movie.id
    @review.save
    redirect_back(fallback_location: root_path)

    # @other_content = OtherContent.find(params[:other_content_id])
    # @post = current_user.posts.new(other_content_id: @other_content.id)
    # @post.save!
    # redirect_back(fallback_location: root_path)
  # rescue ActiveRecord::RecordInvalid => e
  #   pp e.record.errors
  end


  def update
    @movie = Movie.find(params[:movie_id])
    @review = current_user.reviews.find_by(movie_id: @movie.id)
    @review.update(review_params)
    redirect_back(fallback_location: root_path)

  end

  private

  def review_params
    params.require(:review).permit(:user_id, :movie_id, :star, :comment)
  end

end
