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

    @movie_comment = MovieComment.new

  end

  def index
    #if params[:looking_for].present?
      @movies = []
      results = JSON.parse((Tmdb::Movie.popular).to_json)
      i = 0
      # TODO: Hash#dig(https://docs.ruby-lang.org/ja/latest/method/Hash/i/dig.html)
      while i < results.dig('table', 'results').count
        begin
          unless Movie.find_by(name: results.dig('table', 'results', i, 'table', 'id')).present?
            @movies << Movie.create!(
              name: results.dig('table','results',i,'table','id'),
              title: results.dig('table','results',i,'table','title'),
              intro: results.dig('table','results',i,'table','overview'),
              releasedate: Date.parse(results.dig('table','results',i,'table','release_date'))
            )
          else
            @movies << Movie.find_by(name: results.dig('table','results',i,'table','id'))
          end
          i += 1

        rescue ActiveRecord::RecordInvalid => e
          pp e
        end
      end
    #end
  end


end
