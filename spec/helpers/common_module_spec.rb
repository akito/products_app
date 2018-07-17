require 'spec_helper'

RSpec.describe Ownable do
  describe '#owned_by?' do
    let!(:user) { create(:user) }
    let!(:product) { create(:product) }

    context 'when product is owned by user' do
      it 'should be true' do
        product.user_id = user.id
        expect(product.owned_by?(user)).to be true
      end
    end
    context 'when product is not owned by user' do
      it 'should be true' do
        product.user_id != user.id
        expect(product.owned_by?(user)).to be false
      end
    end
  end
end
