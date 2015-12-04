require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  let(:medium) do
    Movie.create(create_params[:movie])
  end

  # let(:medium_class) do
  #     Movie
  # end



  let(:create_params) do
    {
      movie: {
        title: "Something",
        director: "Uncle Bob",
        ranking: 3,
        description: "description"
      }
    }
  end

  let(:update_params) do
    { id: medium.id,
      movie: {
        title: "Something",
        director: "Uncle Joe",
        ranking: 0,
        description: "new description"
      }
    }
  end

  let(:bad_params) do
    {id: medium.id,
      movie: {title: ""}
    }
  end

  it_behaves_like "a medium controller", "movie_path", Movie, "movies_path"


  describe "GET 'home'" do
    it "renders the home view" do
      get :home
      expect(subject).to render_template :home
    end
  end
end
