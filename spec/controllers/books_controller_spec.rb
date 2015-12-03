require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  it_behaves_like "a medium"
  #write the spec to correspond to verb you hope to get and action associated w/ it
  # this simply checks for success, not whether or not content is correct
  # describe "GET 'index'" do
  #   it "is successful" do
  #     # you can simply use verb and action
  #     get :index
  #     #this invokes a request and the result of the request is a response
  #     expect(response.status).to eq 200
  #     # other things can come in response besides status but that is the 1st
      # thing we'll check for.
  #   end
  # end

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
