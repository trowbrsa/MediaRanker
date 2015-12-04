require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  let(:medium) do
    Book.create(create_params[:book])
  end

  it_behaves_like "a medium controller"


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
    { id: medium.id,
      book: {
        title: "Something",
        author: "Uncle Joe",
        ranking: 0,
        description: "new description"
      }
    }
  end

  let(:bad_params) do
    {id: medium.id,
      book: {title: ""}
    }
  end

end
