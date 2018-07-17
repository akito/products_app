require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  let(:category) { create(:category) }
  let(:guest) { create(:user) }
  let(:admin) { create(:user, :admin) }
  let(:valid_attributes) { { name: 'test' } }
  let(:invalid_attributes) { { name: nil } }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: category.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    context 'when admin user logs in' do
      it "returns a success response" do
        sign_in admin
        get :new, params: {}
        expect(response).to be_successful
      end
    end
    context 'when guest user logs in' do
      it "returns a failure response" do
        sign_in guest
        get :new, params: {}
        expect(response).not_to be_successful
      end
    end
  end

  describe "GET #edit" do
    context 'when admin user logs in' do
      it "returns a success response" do
        sign_in admin
        get :edit, params: { id: category.to_param }
        expect(response).to be_successful
      end
    end
    context 'when guest user logs in' do
      it "returns a failure response" do
        sign_in guest
        get :edit, params: { id: category.to_param }
        expect(response).not_to be_successful
      end
    end
  end


  describe "POST #create" do
    context 'when guest user logs in' do
      context "with valid params" do
        it "creates a new Category" do
          sign_in admin
          expect {
            post :create, params: { category: valid_attributes }
          }.to change(Category, :count).by(1)
        end

        it "redirects to the created category" do
          sign_in admin
          post :create, params: { category: valid_attributes }
          expect(response).to redirect_to(Category.last)
        end
      end

      context "with invalid params" do
        it "returns a success response" do
          sign_in admin
          post :create, params: { category: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end

    context 'when guest user logs in' do
        it "returns a failure response" do
          sign_in guest
          post :create, params: { category: valid_attributes }
          expect(response).not_to be_successful
        end
      end
  end

  describe "PUT #update" do
    context 'when guest user logs in' do
      context "with valid params" do
        let(:new_attributes) {
          { name: 'test update' }
        }

        it "updates the requested category" do
          category = Category.create! valid_attributes
          sign_in admin
          put :update, params: { id: category.to_param, category: new_attributes }
          category.reload
          expect(category.name).to eq(new_attributes[:name])
        end

        it "redirects to the category" do
          category = Category.create! valid_attributes
          sign_in admin
          put :update, params: { id: category.to_param, category: valid_attributes }
          expect(response).to redirect_to(category)
        end
      end

      context "with invalid params" do
        it "returns a success response" do
          category = Category.create! valid_attributes
          sign_in admin
          put :update, params: { id: category.to_param, category: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end
    context 'when guest user logs in' do
      it "returns a failure response" do
        category = Category.create! valid_attributes
        sign_in guest
        put :update, params: { id: category.to_param, category: valid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    context 'when guest user logs in' do
      it "destroys the requested category" do
        category = Category.create! valid_attributes
        sign_in admin
        expect {
          delete :destroy, params: { id: category.to_param }
        }.to change(Category, :count).by(-1)
      end

      it "redirects to the categories list" do
        category = Category.create! valid_attributes
        sign_in admin
        delete :destroy, params: { id: category.to_param }
        expect(response).to redirect_to(categories_url)
      end
    end
    context 'when guest user logs in' do
      it "returns a failure response" do
        category = Category.create! valid_attributes
        sign_in guest
        put :destroy, params: { id: category.to_param }
        expect(response).not_to be_successful
      end
    end
  end
end
