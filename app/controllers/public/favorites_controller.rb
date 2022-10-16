class Public::FavoritesController < ApplicationController
  def first_create
    movie = Movie.create(movie_params)
    current_user.favorites.find_or_create_by(movie_id: movie.id)
    redirect_back(fallback_location: root_url)
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @favorite = current_user.favorites.find_or_create_by(movie_id: @movie.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @favorite = current_user.favorites.find_by(movie_id: @movie.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end

  def movie_params
    params.require(:movie).permit(:name, :title, :intro, :releasedate)
  end
end
