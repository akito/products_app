require 'spec_helper'


RSpec.describe CommonModule, type: :model do
  describe '#owned_by?' do
    context 'when product is owned by user' do
      it "should be true " do
        product = Product.new(
          name: 'product_name',
          url: 'https://example.com',
          desc: 'this is cool service.',
          user_id: 1
        )
        user = User.new(
          name: 'user',
          email: 'user@test.com',
          password: 'usrpassword',
          id: 1
        )

        expect(product.owned_by?(user)).to be_truthy
      end
    end
    context 'when product is not owned by user' do
      it 'should be true' do
        product = Product.new(
          name: 'product_name',
          url: 'https://example.com',
          desc: 'this is cool service.',
          user_id: 1
        )
        user = User.new(
          name: 'user',
          email: 'user@test.com',
          password: 'usrpassword',
          id: 2
        )
        expect(product.owned_by?(user)).to be_falsey
      end
    end
  end
end
