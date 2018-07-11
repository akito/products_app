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
  it 'is valid with a user_id, product_id' do
    product = Product.create(
      id: 1,
      name: 'product_name',
      url: 'https://example.org',
      desc: 'this is cool service.'
    )
    user = User.create(
      id: 1,
      name: 'user1',
      email: 'user@test.org',
      password: 'usrpassword'
    )
    like = Like.new(user_id: 1, product_id: 1)
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
