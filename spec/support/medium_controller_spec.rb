RSpec.shared_examples "a medium controller" do

  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'new'" do
    it "renders new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "GET 'edit'" do
    it "renders new view" do
      get :edit, id: medium.id
      expect(subject).to render_template :edit
    end
  end

  describe "GET 'show'" do
    it "renders the show view" do
      get :show, id: medium.id
      expect(subject).to render_template :show
    end
  end

  describe "PATCH 'update'" do

    it "redirects to show page" do
      patch :update, update_params
      expect(subject).to redirect_to show_path
    end

    it "renders edit template on error" do
    post :update, bad_params
    expect(subject).to render_template :edit
    end

  end

end
