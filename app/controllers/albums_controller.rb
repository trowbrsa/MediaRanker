class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def new
    @title = "Add an Album"
    @action = :create
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_path(@album)
    else
      render "new"
    end
  end

  def show
    id = params[:id]
    @album = Album.find(id)
  end

  def edit
    @title = "Edit an Album"
    id = params[:id]
    @album = Album.find(id)
    @action = :update
  end

  def update
    id = params[:id]
    @album = Album.find(id)
    @album.update(album_params[:album])
    redirect_to album_path(params[:id])
  end

  def destroy
    Album.destroy(params[:id])
    redirect_to albums_path
  end

  def upvote
    id = params[:id]
    album = Album.find(id)
    r = album.ranking
    r += 1
    album.update(ranking: r)
    redirect_to :back
  end

  private

  def album_params
    params.permit(album:[:author, :title, :ranking, :description])
  end

end
