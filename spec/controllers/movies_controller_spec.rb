require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  let(:medium) do
    Movie.create(create_params[:movie])
  end

  it_behaves_like "a medium"

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

  describe "GET 'home'" do
    it "renders the home view" do
      get :home
      expect(subject).to render_template :home
    end
  end


  describe "POST 'create'" do

    it "redirects to show page" do
    post :create, create_params
    new_movie = Movie.last
    expect(subject).to redirect_to movie_path(new_movie.id)
    end

    it "renders new template on error" do
    post :create, bad_params
    expect(subject).to render_template :new
    end
  end

  describe "PATCH 'update'" do

    it "redirects to show page" do
      patch :update, update_params
      expect(subject).to redirect_to movie_path(medium.id)
    end

    it "renders edit template on error" do
    post :update, bad_params
    expect(subject).to render_template :edit
    end

  end

  describe "DELETE 'destroy'" do
    it "redirects to index page" do
      delete :destroy, update_params
      expect(subject).to redirect_to movies_path
    end
  end

    describe "POST ''#upvote_movie'" do

    before :each do
      request.env["HTTP_REFERER"] = "from_where_I_was"
    end

    it "increments :votes" do
      patch :upvote, id: medium.id
      medium.reload
      expect(medium.ranking).to eq 4
      expect(subject).to redirect_to "from_where_I_was"
    end
  end
end
