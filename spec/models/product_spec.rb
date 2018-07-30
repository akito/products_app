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
#  user_id     :bigint(8)
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

    context 'when product is liked by user' do
      it 'should be true' do
        expect(like.product.liked?(like.user)).to be true
      end
    end
    context 'when user do NOT like a product' do
      it 'should be false' do
        expect(product.liked?(product.user)).to be false
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
    let(:tag) { create(:tag) }
    it "output tag's label as String" do
      product.tags << tag
      expect(product.tags_to_s).to eq tag.label
    end
  end
end
