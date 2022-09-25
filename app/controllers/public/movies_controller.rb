class Public::MoviesController < ApplicationController

  require 'themoviedb-api'
  Tmdb::Api.key("9fc82c7a8627ce0ae30513d2998cad7c")
  Tmdb::Api.language("ja") # こちらで映画情報の表示の際の言語設定を日本語にできます

  def show
    @movie = JSON.parse((Tmdb::Movie.detail(params[:id])).to_json)
  end

  def index
    @movieinfo = JSON.parse((Tmdb::Movie.popular).to_json)
  end


end
