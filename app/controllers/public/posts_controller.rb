class Public::PostsController < ApplicationController


  def destroy
    @other_content = OtherContent.find(params[:other_content_id])
    @post = current_user.posts.find_by(other_content_id: @other_content.id)
    @post.destroy
    redirect_back(fallback_location: root_path)
  end

  def create
    @other_content = OtherContent.find(params[:other_content_id])
    @post = current_user.posts.new(post_params)
    @post.other_content_id = @other_content.id
    @post.save
    redirect_back(fallback_location: root_path)

    # @other_content = OtherContent.find(params[:other_content_id])
    # @post = current_user.posts.new(other_content_id: @other_content.id)
    # @post.save!
    # redirect_back(fallback_location: root_path)
  # rescue ActiveRecord::RecordInvalid => e
  #   pp e.record.errors
  end


  def update
    @other_content = OtherContent.find(params[:other_content_id])
    @post = current_user.posts.find_by(other_content_id: @other_content.id)
    @post.update(post_params)
    redirect_back(fallback_location: root_path)

  end

  private

  def post_params
    params.require(:post).permit(:user_id, :other_content_id, :star, :comment)
  end
end
