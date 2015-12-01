require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  let(:create_params) do
    {
      movie: {
        title: "Something",
        director: "Uncle Bob",
        ranking: 0,
        description: "description"
      }
    }
  end

  let(:movie) do
    Movie.create(create_params[:movie])
  end

  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'new'" do
    it "renders new view" do
      get :new
      expect(subject). to render_template :new
    end
  end

  describe "GET 'show'" do

    it "renders the show view" do
      get :show, id: movie.id
      expect(subject).to render_template :show
    end
  end

  describe "POST 'create'" do

    let(:bad_params) do
      {
        movie: {}
      }
    end

    it "redirects to show page" do
    post :create, create_params

    expect(subject).to redirect_to movie_path(1)
    end

    it "renders new template on error" do
    post :create, bad_params
    expect(subject).to render_template :new
    end
  end

  describe "PATCH 'update'" do
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
      {
        movie: {}
      }
    end

    it "redirects to show page" do

      patch :update, update_params
      expect(subject).to redirect_to movie_path(movie.id)
    end
  end



end
