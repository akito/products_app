require 'spec_helper'

RSpec.describe Ownable do
  let(:product) { create :product, :with_user }
  describe '#owned_by?' do
    it 'should be true when product is owned by user' do
      expect(product.owned_by?(product.user)).to be true
    end
  end
end
