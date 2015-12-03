class MoviesController < ApplicationController

  def home
    @movies = Movie.all
    # make it so only top 10 show up
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
    @movie = Movie.new(movie_params[:movie])
    @movie.update(:ranking => 0)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
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

## use attributes, save it to a local variable (its a hash)
# then use .save boolean to test against
  def update
    @value = params[:ranking]
    id = params[:id]
    @movie = Movie.find(id)
    @movie.attributes = movie_params[:movie]
      if @movie.save
      redirect_to movie_path(params[:id])
      else
        @title = "Edit a movie"
        @action = :update
        render :edit
      end
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to movies_path
  end

  def upvote
    id = params[:id]
    @movie = Movie.find(id)
    r = @movie.ranking
    r += 1
    @movie.update(ranking: r)
    redirect_to :back
  end

  private

  def movie_params
    params.permit(movie: [:title, :director, :ranking, :description])
  end
end
