class Admin::LikesController < ApplicationController
  before_action :authenticate_admin!
  
  def create
    @other_content = OtherContent.find(params[:other_content_id])
    @like = current_user.likes.new(other_content_id: @other_content.id)
    @like.save!
    redirect_back(fallback_location: root_path)
  rescue ActiveRecord::RecordInvalid => e
    pp e
  end
  
  def destroy
    @other_content = OtherContent.find(params[:other_content_id])
    @like = current_user.likes.find_by(other_content_id: @other_content.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
  
end
