require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
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
    { id: movie.id,
      movie: {
        title: "Something",
        director: "Uncle Joe",
        ranking: 0,
        description: "new description"
      }
    }
  end

  let(:bad_params) do
    {id: movie.id,
      movie: {title: ""}
    }
  end

  let(:movie) do
    Movie.create(create_params[:movie])
  end

  describe "GET 'edit'" do

    it "renders new view" do
      get :edit, id: movie.id
      expect(subject).to render_template :edit
    end
  end

  describe "GET 'show'" do

    it "renders the show view" do
      get :show, id: movie.id
      expect(subject).to render_template :show
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
      expect(subject).to redirect_to movie_path(movie.id)
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
      patch :upvote, id: movie.id
      movie.reload
      expect(movie.ranking).to eq 4
      expect(subject).to redirect_to "from_where_I_was"
    end
  end
end
