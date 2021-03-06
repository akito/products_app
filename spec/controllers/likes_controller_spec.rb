require "rails_helper"

RSpec.describe LikesController, type: :controller do
  let!(:guest) { create(:user) }
  let!(:product) { create(:product) }
  let(:valid_attributes) { { user_id: guest.id, product_id: product.id } }
  let(:invalid_attributes) { { user_id: nil, product_id: nil } }

  describe "POST #create" do
    context "when guest user logs in" do
      context "with valid params" do
        it "creates a new Like" do
          sign_in guest
          expect do
            post :create, params: { like: valid_attributes }, xhr: true
          end.to change(Like, :count).by(1)
        end
      end

      context "with invalid params" do
        it "returns a failure response" do
          sign_in guest
          expect do
            post :create, params: { like: invalid_attributes }, xhr: true
          end.to change(Like, :count).by(0)
        end
      end
    end

    context "When anyone not logged in" do
      it "returns a failure response" do
        post :create, params: { like: valid_attributes }, xhr: true
        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    context "when guest user logs in" do
      it "destroys the requested like" do
        like = Like.create! valid_attributes
        sign_in guest
        expect do
          delete :destroy, params: { id: like.to_param }, xhr: true
        end.to change(Like, :count).by(-1)
      end
    end
    context "When anyone not logged in" do
      it "returns a failure response" do
        like = Like.create! valid_attributes
        delete :destroy, params: { id: like.to_param }, xhr: true
        expect(response).not_to be_successful
      end
    end
  end
end
