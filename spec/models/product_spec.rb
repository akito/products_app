# == Schema Information
#
# Table name: products
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  url         :string           not null
#  desc        :text             not null
#  image       :string
#  thumbnail   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  likes_count :integer          default(0), not null
#  status      :integer          default("draft"), not null
#  category_id :bigint(8)
#

require 'rails_helper'
RSpec.describe Product, type: :model do
  describe 'Validation' do
    let!(:product) { create(:product) }
    it 'is valid with a name, url, desc' do
      expect(product.valid?).to be true
    end

    it 'is invalid without a name' do
      product.name = nil
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without a url' do
      product.url = nil
      product.valid?
      expect(product.errors[:url]).to include("can't be blank")
    end

    it 'is invalid without a description' do
      product.desc = nil
      product.valid?
      expect(product.errors[:desc]).to include("can't be blank")
    end

    it 'is invalid with a duplicate name' do
      overlap_name = build(:product, name: product.name)
      overlap_name.valid?
      expect(overlap_name.errors[:name]).to include("has already been taken")
    end
    it 'is invalid with a duplicate url' do
      overlap_url = build(:product, url: product.url)
      overlap_url.valid?
      expect(overlap_url.errors[:url]).to include("has already been taken")
    end
  end

  describe 'scope' do
    describe 'created_after(arg = 1.weeks.ago )' do
      let!(:old_product) { create(:product, created_at: 1.weeks.ago) }
      let!(:new_product) { create(:product, created_at: 1.day.ago) }

      context 'when product created one week ago' do
        it 'dose NOT include the product' do
          expect(Product.created_after(1.weeks.ago)).not_to include old_product
        end
      end
      context 'when product created yesterday' do
        it 'includes the product ' do
          expect(Product.created_after(1.weeks.ago)).to include new_product
        end
      end
    end

    describe "like_ranking(arg = 3)" do
      let(:bad_product) { create(:product) }
      let(:ordinary_product) { create(:product) }
      let(:popular_product) { create(:product) }
      let!(:like) { create(:like, product: ordinary_product) }
      let!(:likes) { create_list(:like, 2,  product: popular_product) }

      it 'includes only liked products only' do
        expect(Product.like_ranking(3)).not_to include bad_product
      end

      it 'is in order of likes count' do
        expect(Product.like_ranking(3)).to match [popular_product, ordinary_product]
      end
    end

  end

  describe '#like_by' do
    let!(:like) { create(:like) }
    context 'when user like a product' do
      it 'should NOT be nil' do
        expect(like.product.like_by(like.user)).to_not be nil
      end
    end
    context 'when user do NOT like a product' do
      it 'should be nil' do
        expect(like.product.like_by(User.new)).to be nil
      end
    end
  end

  describe '#liked?' do
    let!(:product) { create(:product) }
    let(:like) { create(:like) }
    let(:user) { create(:user) }

    context 'when product is liked by user' do
      it 'should be true' do
        expect(like.product.liked?(like.user)).to be true
      end
    end
    context 'when user do NOT like a product' do
      it 'should be false' do
        expect(product.liked?(user)).to be false
      end
    end
  end

  describe '#related_products(max = 3)' do
    let(:trip) { create(:category, name: 'Trip') }
    let(:food) { create(:category, name: 'Food') }
    let!(:trip_product) { create(:product, category: trip) }
    let!(:food_products) { create_list(:product, 4, category: food) }

    before do
      @food_product = food_products.first
    end

    it 'returns same category products' do
      expect(@food_product.related_products(5)).to match food_products[1..-1]
    end

    it 'does not return products of different category' do
      expect(@food_product.related_products(5)).not_to include trip_product
    end

    it 'does not return self' do
      expect(@food_product.related_products(5)).not_to include @food_product
    end

    it 'returns products less than or equal to the argument' do
      expect(@food_product.related_products(2).count).to eq  2
    end
  end
end
