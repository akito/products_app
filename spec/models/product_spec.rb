# == Schema Information
#
# Table name: products
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  url         :string
#  desc        :text
#  image       :string
#  thumbnail   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint(8)
#  likes_count :integer          default(0), not null
#

require 'rails_helper'

RSpec.describe Product, type: :model do
  it "名前がそのまま返ること" do
    product = Product.new(name: "名前")
    expect(product.name).to eq "名前"
  end
end
