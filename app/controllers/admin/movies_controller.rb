class Admin::MoviesController < ApplicationController
  
  before_action :authenticate_admin!
  
   require 'themoviedb-api'
  Tmdb::Api.key("9fc82c7a8627ce0ae30513d2998cad7c")
  Tmdb::Api.language("ja") # こちらで映画情報の表示の際の言語設定を日本語にできます

  def show
  @movie_info = JSON.parse((Tmdb::Movie.detail(params[:id])).to_json)
    @movie_comment = MovieComment.new
    @review = Review.new
    unless Movie.find_by(name: @movie_info["table"]["id"]).present?
      @movie = Movie.new
      @movie.name = @movie["table"]["id"].to_s
      @movie.title = @movie["table"]["title"].to_s
      @movie.releasedate = @movie["table"]['release_date'].to_s
      @movie.intro = @movie["table"]['overview'].to_s
      @movie.save!
    else
      @movie = Movie.find_by(name: @movie_info["table"]["id"])
    end
  rescue ActiveRecord::RecordInvalid => e
    pp e
  end

  def index

#検索した時のアクション
  
     if params[:looking_for].present?
       @results = JSON.parse((Tmdb::Search.movie(params[:looking_for])).to_json)
     else
      # TODO: pagenate_array(https://techtechmedia.com/page-for-array-kaminari/)
        @results = JSON.parse((Tmdb::Movie.popular).to_json)
     end
      # puts @results.dig('table', 'results').count
      @movies = @results.dig('table', 'results').map.with_index(0) do |o, i|
        Movie.find_or_initialize_by(
          name: @results.dig('table','results',i,'table','id'),
          title: @results.dig('table','results',i,'table','title'),
          intro: @results.dig('table','results',i,'table','overview'),
          releasedate: Date.parse(@results.dig('table','results',i,'table','release_date'))
        )
      end
      @movies = Kaminari.paginate_array(@movies, total_count: @movies.count).page(params[:page]).per(10)
  end

end
