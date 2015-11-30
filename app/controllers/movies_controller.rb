class MoviesController < ApplicationController

  def home
    # some kind of code that only shows top 10 of each category by ranking
  end

  def index
    @movies = Movie.all
  end

  def new
    @action = :create
    @movie = Movie.new
  end

  def create
    @title = "Add a movie"
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render "new"
    end
  end

  def show
    id = params[:id]
    @movie = Movie.find(id)
  end

  def edit
    @title = "Edit a movie"
    id = params[:id]
    @movie = Movie.find(id)
    @action = :update
  end

  def update
    id = params[:id]
    @movie = Movie.find(id)
    @movie.update(movie_params[:movie])
    redirect_to movie_path(params[:id])
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to movies_path
  end

  private

  def movie_params
    params.permit(movie: [:title, :director, :ranking, :description])
  end
end
