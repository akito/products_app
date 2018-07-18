require 'spec_helper'

RSpec.describe Ownable do
  describe '#owned_by?' do
    let(:user) { create :user }
    let(:product) { create :product, user: user }
    it 'should be true when product is owned by user' do
      expect(product.owned_by?(user)).to be true
    end
  end
end
