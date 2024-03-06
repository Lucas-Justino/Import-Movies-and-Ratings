require 'csv'

class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @movies = Movie.all
    respond_to do |format|
      format.html
      format.json { render json: @movies.to_json(methods: :average_score) }
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: "Movie was successfully created."
    else
      render :new
    end
  end

  def import
    file = params[:file]
    imported_count = 0

    CSV.foreach(file.path, headers: true) do |row|
      movie = Movie.find_by(title: row['Title'])
      next if movie
      Movie.create(title: row['Title'], director: row['Director'])
      imported_count += 1
    end

    redirect_to movies_path, notice: "#{imported_count} filmes importados com sucesso."
  end

  def submit_ratings
    file = params[:file]
    CSV.foreach(file.path, headers: true) do |row|
      movie = Movie.find_by(title: row['Title'])
      next unless movie 
      user_movie = current_user.user_movies.find_or_initialize_by(movie_id: movie.id)
      user_movie.score = row['Rating']
      user_movie.save
    end
    redirect_to movies_path, notice: "Notas submetidas com sucesso."
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director)
  end
end
