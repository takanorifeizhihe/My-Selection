class Admin::OthercontentCommentsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def create
    @other_content = OtherContent.find(params[:other_content_id])
    @comment = current_user.othercontent_comments.new(othercontent_comment_params)
    @comment.other_content_id = @other_content.id
    @comment.save
    redirect_to admin_other_content_path(@other_content)
  end

  def destroy
    OthercontentComment.find(params[:id]).destroy
    redirect_to admin_other_content_path(params[:other_content_id])
  end

  private

  def othercontent_comment_params
    params.require(:othercontent_comment).permit(:comment)
  end
end
