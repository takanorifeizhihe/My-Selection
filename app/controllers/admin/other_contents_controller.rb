class Admin::OtherContentsController < ApplicationController

before_action :authenticate_admin!

  def index
    @other_content = OtherContent.new
    @other_contents = OtherContent.all.page(params[:page]).per(10)
  end

  def edit
    @other_content = OtherContent.find(params[:id])
  end

  def show
    @other_content = OtherContent.find(params[:id])
    @othercontent_comment = OthercontentComment.new

  end

  def create
    @other_content = OtherContent.new(other_content_params)
    #binding.pry
    @other_content.save!
    if @other_content.errors.any?
      @other_content.errors.full_messages.each do |msg|
        pp msg
      end
    end
    redirect_to admin_other_content_path(@other_content)

  end

  def update
    @other_content = OtherContent.find(params[:id])
    @other_content.update(other_content_params)
    redirect_to admin_other_content_path(@other_content)
  end

  def destroy
    @other_content = OtherContent.find(params[:id])
    @other_content.destroy
    redirect_to  admin_other_contents_path
  end

  private

  def other_content_params
    params.require(:other_content).permit(:genre_id, :title, :release_date, :image)
  end

end
