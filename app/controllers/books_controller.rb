class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @title = "Add a Book"
    @action = :create
    @book = Book.new
  end


  def create
    @title = "Add a book"
    @book = Book.new(book_params[:book])
    @book.update(:ranking => 0)
    if @book.save
      redirect_to book_path(@book)
    else
      render "new"
    end
  end

  def show
    id = params[:id]
    @book = Book.find(id)
  end

  def edit
    @title = "Edit a book"
    id = params[:id]
    @book = Book.find(id)
    @action = :update
  end

  def update
    id = params[:id]
    @book = Book.find(id)
    @book.update(book_params[:book])
    redirect_to book_path(params[:id])
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to books_path
  end

  def upvote
    id = params[:id]
    book = Book.find(id)
    r = book.ranking
    r += 1
    book.update(ranking: r)
    redirect_to :back
  end

  private

  def book_params
    params.permit(book:[:author, :title, :ranking, :description])
  end
end
