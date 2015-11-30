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
    id = params[:id]
    @movie = Movie.find(id)
    @action = :update
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to movies_path


  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director, :ranking, :description)
  end
end
