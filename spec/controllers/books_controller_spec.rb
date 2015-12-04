require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  let(:medium) do
    Movie.create(create_params[:book])
  end

  it_behaves_like "a medium"


  let(:create_params) do
    {
      book: {
        title: "Something",
        author: "Uncle Bob",
        ranking: 3,
        description: "description"
      }
    }
  end

  let(:update_params) do
    { id: book.id,
      book: {
        title: "Something",
        author: "Uncle Joe",
        ranking: 0,
        description: "new description"
      }
    }
  end

  let(:bad_params) do
    {id: book.id,
      movie: {title: ""}
    }
  end

  let(:book) do
    Book.create(create_params[:book])
  end
end
