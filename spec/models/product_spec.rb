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
#  status      :integer          default(0), not null
#  category_id :bigint(8)
#

require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with a name, url, desc' do
    product = Product.new(
      name: 'product_name',
      url: 'https://example.com',
      desc: 'this is cool service.'
    )
    expect(product.valid?).to be_truthy
  end


  it 'is invalid without a name' do
    product = Product.new(name: nil)
    product.valid?
    expect(product.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a url' do
    product = Product.new(url: nil)
    product.valid?
    expect(product.errors[:url]).to include("can't be blank")
  end

  it 'is invalid without a description' do
    product = Product.new(desc: nil)
    product.valid?
    expect(product.errors[:desc]).to include("can't be blank")
  end
  it 'is invalid with a duplicate name' do
    Product.create(
      name: 'product_name',
      url: 'https://example.com',
      desc: 'this is cool service.'
    )
    product = Product.new(
      name: 'product_name',
      url: 'https://example.com',
      desc: 'this is cool service.'
    )
    product.valid?
    expect(product.errors[:name]).to include("has already been taken")
  end

  it 'is invalid with a duplicate url' do
    Product.create(
      name: 'product_name',
      url: 'https://example.com',
      desc: 'this is cool service.'
    )

    product = Product.new(
      name: 'product_name',
      url: 'https://example.com',
      desc: 'this is cool service.'
    )

    product.valid?
    expect(product.errors[:url]).to include("has already been taken")
  end

  describe '#liked?' do
    context 'when user like a product' do
      it 'should be true' do
        product = Product.create(
          id: 1,
          name: 'product_name',
          url: 'https://example.com',
          desc: 'this is cool service.'
        )
        user = User.create(
          id: 1,
          name: 'user',
          email: 'user@test.com',
          password: 'usrpassword'
        )
        Like.create(
          product_id: 1,
          user_id: 1
        )
        expect(product.liked?(user)).to be_truthy
      end
    end
    context 'when user do NOT like a product' do
      it 'should be false' do
        product = Product.create(
          id: 2,
          name: 'product_name2',
          url: 'https://example.org',
          desc: 'this is cool service.'
        )
        user = User.create(
          id: 2,
          name: 'user2',
          email: 'user@test.org',
          password: 'usrpassword'
        )
        Like.create(
          product_id: 3,
          user_id: 3
        )
        expect(product.liked?(user)).to be_falsey
      end
    end
  end

  describe '#like' do
    context 'when user like a product' do
      it 'should NOT be nil' do
        product = Product.create(
          id: 1,
          name: 'product_name',
          url: 'https://example.com',
          desc: 'this is cool service.'
        )
        user = User.create(
          id: 1,
          name: 'user',
          email: 'user@test.com',
          password: 'usrpassword'
        )
        Like.create(
          product_id: 1,
          user_id: 1
        )
        expect(product.like(user)).to_not be nil
      end
    end
    context 'when user do NOT like a product' do
      it 'should be nil' do
        product = Product.create(
          id: 2,
          name: 'product_name2',
          url: 'https://example.org',
          desc: 'this is cool service.'
        )
        user = User.create(
          id: 2,
          name: 'user2',
          email: 'user@test.org',
          password: 'usrpassword'
        )
        Like.create(
          product_id: 3,
          user_id: 3
        )
        expect(product.like(user)).to be nil
      end
    end
  end







  def like(user)
    likes.find_by(user_id: user.id)
  end





end
