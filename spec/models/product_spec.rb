# == Schema Information
#
# Table name: products
#
#  id            :bigint(8)        not null, primary key
#  name          :string           not null
#  url           :string           not null
#  desc          :text             not null
#  image         :string
#  thumbnail     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  likes_count   :integer          default(0), not null
#  status        :integer          default("draft"), not null
#  category_id   :bigint(8)
#  ogpimage      :string
#  sub_title     :string
#  twitter       :string
#  advertisement :integer          default("no"), not null
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
      expect(product.valid?).to be false
    end

    it 'is invalid without a url' do
      product.url = nil
      expect(product.valid?).to be false
    end

    it 'is invalid without a description' do
      product.desc = nil
      expect(product.valid?).to be false
    end

    it 'is invalid with a duplicate name' do
      overlap_name = build(:product, name: product.name)
      expect(overlap_name.valid?).to be false
    end
    it 'is invalid with a duplicate url' do
      overlap_url = build(:product, url: product.url)
      expect(overlap_url.valid?).to be false
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

  describe '#add_tags' do
    let(:product) { create(:product) }
    tags = ['blue', 'red' ]

    it 'adds some tags' do
      expect(product.add_tags(tags)).to match_array tags
    end
  end

  describe '#tags_to_s' do
    let(:product) { create(:product) }
    let(:tags) { create_list(:tag, 2) }
    it 'returns a label delimited by a space' do
      product.tags << tags
      expect(product.tags_to_s).to eq "#{tags[0].label} #{tags[1].label}"
    end
  end


  describe '#related_products(max = 3)' do
    let(:trip) { create(:category, name: 'Trip') }
    let(:food) { create(:category, name: 'Food') }
    let!(:trip_product) { create(:product, category: trip, status: 'published') }
    let!(:food_products) { create_list(:product, 4, category: food,  status: 'published') }

    before do
      @food_product = food_products.first
    end

    it '同じカテゴリーのプロダクトを返す(順不同)' do
      expect(@food_product.related_products(5)).to match_array food_products[1..-1]
    end

    it '異なるカテゴリーのプロダクトを返さない' do
      expect(@food_product.related_products(5)).not_to include trip_product
    end

    it '自分自身を返さない' do
      expect(@food_product.related_products(5)).not_to include @food_product
    end

    it '引数以下の数のプロダクトを返す' do
      expect(@food_product.related_products(2).count).to eq 2
    end
    it 'draftのプロダクトを返さない' do
      draft = food_products.last.status = 'draft'
      expect(@food_product.related_products(5)).not_to include draft
    end
  end
end
