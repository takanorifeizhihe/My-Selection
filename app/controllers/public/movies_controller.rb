class Public::MoviesController < ApplicationController

  require 'themoviedb-api'
  Tmdb::Api.key("9fc82c7a8627ce0ae30513d2998cad7c")
  Tmdb::Api.language("ja") # こちらで映画情報の表示の際の言語設定を日本語にできます

  def show

    @movie = JSON.parse((Tmdb::Movie.detail(params[:id])).to_json)

    unless Movie.find_by(name: @movie["table"]["id"]).present?
      @movie_info = Movie.new
      @movie_info.name = @movie["table"]["id"].to_s
      @movie_info.title = @movie["table"]["title"].to_s
      @movie_info.save!
    else
      @movie_info = Movie.find_by(name: @movie["table"]["id"])
    end
  rescue ActiveRecord::RecordInvalid => e
    pp e

  end

  def index
    @movie = JSON.parse((Tmdb::Movie.popular).to_json)

    unless Movie.find_by(name: @movie["table"]["id"]).present?
      @movie_info = Movie.new
      @movie_info.name = @movie["table"]["id"].to_s
      @movie_info.title = @movie["table"]["title"].to_s
      @movie_info.save!
    else
      @movie_info = Movie.find_by(name: @movie["table"]["id"])
    end
  rescue ActiveRecord::RecordInvalid => e
    pp e

  end


end
