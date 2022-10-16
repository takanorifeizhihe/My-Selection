class Public::MovieCommentsController < ApplicationController

  require 'themoviedb-api'
  Tmdb::Api.key("9fc82c7a8627ce0ae30513d2998cad7c")
  Tmdb::Api.language("ja") # こちらで映画情報の表示の際の言語設定を日本語にできます


  def create
    @movie = Movie.find(params[:movie_id])
    @comment = current_user.movie_comments.new(movie_comment_params)
    @comment.movie_id = @movie.id
    @comment.save
    redirect_to movie_path(@movie)
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
