class Admin::MovieCommentsController < ApplicationController
  
  before_action :authenticate_admin!
  
  require 'themoviedb-api'
  Tmdb::Api.key("9fc82c7a8627ce0ae30513d2998cad7c")
  Tmdb::Api.language("ja") # こちらで映画情報の表示の際の言語設定を日本語にできます


  def create
    #@movie = JSON.parse((Tmdb::Movie.detail(params[:id])).to_json)
    @movie = Movie.find(params[:movie_id])
    @movie_comment = current_user.movie_comments.new(movie_comment_params)
    @movie_comment.movie_id = @movie.id
    @movie_comment.save
    redirect_to movie_path(@movie.name)
  end

  def destroy
    MovieComment.find_by(name: @movie["table"]["id"]).destroy
    redirect_to movie_path(params[:movie_id])
  end

  private

  def movie_comment_params
    params.require(:movie_comment).permit(:comment)
  end


end
