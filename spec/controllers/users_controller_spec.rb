require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  describe "GET #show" do

    context 'when user logs in' do
      before do
        sign_in user
        get :show
      end
      it 'returns http success' do
        expect(response).to be_successful
      end
    end

    context 'when user NOT logs in' do
      before do
        get :show
      end
      it 'should be a 302 redirect ' do
        expect(response.status).to eq 302
      end
    end
  end
end
