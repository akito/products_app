require 'rails/all'

RSpec.describe ApplicationHelper, type: :helper do
  describe "#page_title" do
    context 'when @product is NOT defined' do
      it 'return the default title' do
        stub_const('ApplicationHelper::APP_NAME', 'Products APP')
        expect(helper.page_title).to eq('Products APP')
      end
    end
    context 'when @product is defined' do
      it 'return the title with @product.name' do
        @product = create(:product)
        stub_const('ApplicationHelper::APP_NAME', 'Products APP')
        expect(helper.page_title).to eq("Products APP | #{@product.name}")
      end
    end
  end

  describe '#liked?' do
    let!(:product) { create(:product, id: 1) }
    let!(:user) { create(:user, id: 1) }
    context 'when user like a product' do
      it 'should be true' do
        Like.create(user_id: user.id, product_id: product.id)
        expect(liked?(user, product)).to be_truthy
      end
    end
    context 'when user do NOT like a product' do
      it 'should be false' do
        expect(liked?(user, product)).to be_falsey
      end
    end
  end
end
