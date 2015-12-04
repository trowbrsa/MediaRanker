RSpec.shared_examples "a medium controller" do |medium_path, medium_class, medium_index_path|

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
      expect(subject).to redirect_to send(medium_path,*medium.id)
    end

    it "renders edit template on error" do
    post :update, bad_params
    expect(subject).to render_template :edit
    end
  end

  describe "POST 'create'" do

    it "redirects to show page" do
      post :create, create_params
      new_object = medium_class.last
      expect(subject).to redirect_to send(medium_path,*new_object.id)
    end

    it "renders new template on error" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "PATCH 'update'" do

    it "redirects to show page" do
      patch :update, update_params
      expect(subject).to redirect_to send(medium_path,*medium.id)
    end

    it "renders edit template on error" do
      post :update, bad_params
      expect(subject).to render_template :edit
    end
  end

  describe "DELETE 'destroy'" do
    it "redirects to index page" do
      delete :destroy, update_params
      expect(subject).to redirect_to send(medium_index_path)
    end
  end

  describe "POST ''#upvote_method'" do

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
