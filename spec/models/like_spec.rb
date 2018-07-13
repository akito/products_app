# == Schema Information
#
# Table name: likes
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)        not null
#  product_id :bigint(8)        not null
#

require 'rails_helper'

RSpec.describe Like, type: :model do
  let!(:product) { create(:product, id: 1) }
  let!(:user) { create(:user, id: 1) }

  it 'is valid with a user_id, product_id' do
    like = Like.new(user_id: user.id, product_id: product.id)
    expect(like.valid?).to be_truthy
  end

  it 'is invalid without a user_id' do
    like = Like.new(user_id: nil)
    like.valid?
    expect(like.errors[:user_id]).to include("can't be blank")
  end
  it 'is invalid without a product_id' do
    like = Like.new(product_id: nil)
    like.valid?
    expect(like.errors[:product_id]).to include("can't be blank")
  end
end
