require "rails_helper"

RSpec.describe ProductsController, type: :controller do
  let!(:product) { create(:product, status: "published") }
  let!(:draft_product) { create(:product, status: "draft") }
  let(:guest) { create(:user) }
  let(:admin) { create(:user, :admin) }
  let(:valid_attributes) do
    { name: "test", desc: "this is sample", url: "https://test.com" }
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: { q: "product" }
      expect(response).to be_successful
    end

    describe "assigns @products" do
      it "includes published product" do
        published = create(:product, status: "published")
        get :index
        expect(assigns(:products)).to include published
      end

      it "do not include draft product" do
        draft = create(:product, status: "draft")
        get :index
        expect(assigns(:products)).not_to include draft
      end

      it "do not include archived product" do
        archived = create(:product, status: "archived")
        get :index
        expect(assigns(:products)).not_to include archived
      end
      it "includes searched product" do
        product = create(:product, name: "product")
        get :index
        expect(assigns(:products)).not_to include product
      end
      it "do not include not searched product" do
        item = create(:product, name: "item")
        get :index
        expect(assigns(:products)).not_to include item
      end
    end
  end

  describe "GET #show" do
    context "when published product" do
      it "returns a success response" do
        get :show, params: { id: product.to_param }
        expect(response).to be_successful
      end
    end
    context "when unpublished product" do
      it "returns a failure response" do
        get :show, params: { id: draft_product.to_param }
        expect(response).not_to be_successful
      end
    end

    context "when draft product and admin user logs in" do
      it "returns a success response" do
        sign_in admin
        get :show, params: { id: draft_product.to_param }
        expect(response).to be_successful
      end
    end
    context "when draft product and guest user logs in" do
      it "returns a failure response" do
        sign_in guest
        get :show, params: { id: draft_product.to_param }
        expect(response).not_to be_successful
      end
    end
  end

  describe "GET #new" do
    context "when guest user logs in" do
      it "returns a success response" do
        sign_in guest
        get :new, params: {}
        expect(response).to be_successful
      end
    end

    context "When anyone not logged in" do
      it "returns a failure response" do
        get :new, params: {}
        expect(response).not_to be_successful
      end
    end
  end

  describe "GET #edit" do
    context "when admin logs in" do
      it "returns a success response" do
        sign_in admin
        get :edit, params: { id: product.to_param }
        expect(response).to be_successful
      end
    end
    context "when not admin logs in" do
      it "returns a failure response" do
        sign_in guest
        get :edit, params: { id: product.to_param }
        expect(response).not_to be_successful
      end
    end
  end

  describe "POST #create" do
    context "when admin logs in" do
      it "creates a new Product" do
        sign_in admin
        expect do
          post :create, params: { product: valid_attributes }
        end.to change(Product, :count).by(1)
      end

      it "redirects to the created category" do
        sign_in admin
        post :create, params: { product: valid_attributes }
        expect(response).to redirect_to(root_path)
      end
    end

    context "when guest logs in" do
      it "creates a new Product" do
        sign_in guest
        expect do
          post :create, params: { product: valid_attributes }
        end.to change(Product, :count).by(1)
      end

      it "redirects to the created product" do
        sign_in guest
        post :create, params: { product: valid_attributes }
        expect(response).to redirect_to(root_path)
      end
    end
    context "when anyone logged in" do
      it "returns a failure response" do
        post :create, params: { product: valid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "when admin logs in" do
      let(:new_attributes) do
        { name: "test update" }
      end

      it "updates the requested product" do
        sign_in admin
        put :update, params: { id: product.to_param, product: new_attributes }
        product.reload
        expect(product.name).to eq new_attributes[:name]
      end

      it "redirects to the product" do
        sign_in admin
        put :update, params: { id: product.to_param, product: valid_attributes }
        expect(response).to redirect_to(product)
      end
    end
    context "when guest logs in" do
      it "returns a failure response" do
        sign_in guest
        put :update, params: { id: product.to_param, product: valid_attributes }
        expect(response).not_to be_successful
      end
    end
    context "when anyone not logged in" do
      it "returns a failure response" do
        put :update, params: { id: product.to_param, product: valid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    context "when admin logs in" do
      it "destroys the requested category" do
        sign_in admin
        expect do
          delete :destroy, params: { id: product.to_param }
        end.to change(Product, :count).by(-1)
      end

      it "redirects to the categories list" do
        sign_in admin
        delete :destroy, params: { id: product.to_param }
        expect(response).to redirect_to(products_url)
      end
    end
    context "when guest user logs in" do
      it "returns a failure response" do
        sign_in guest
        put :destroy, params: { id: product.to_param }
        expect(response).not_to be_successful
      end
    end
    context "when anyone not logged in" do
      it "returns a failure response" do
        put :destroy, params: { id: product.to_param }
        expect(response).not_to be_successful
      end
    end
  end
end
