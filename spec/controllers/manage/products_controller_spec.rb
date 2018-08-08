require "rails_helper"
RSpec.describe Manage::ProductsController, type: :controller do

  describe "GET #index" do
    let(:guest) { create(:user) }
    let(:admin) { create(:user, :admin) }
    context 'When an administrator is logged in' do
      it "returns a success response" do
        sign_in admin
        get :index, params: {}
        expect(response).to be_successful
      end
    end
    context 'When guest is logged in' do
      it "returns a false response" do
        sign_in guest
        get :index, params: {}
        expect(response).not_to be_successful
      end
    end
    context 'When no one is logged in' do
      it "returns a false response" do
        get :index, params: {}
        expect(response).not_to be_successful
      end
    end
  end
end
