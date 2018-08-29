# == Schema Information
#
# Table name: categories
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require "rails_helper"

RSpec.describe Category, type: :model do
  describe "FactoryGirl be valid" do
    it { expect(build(:category)).to be_valid }
  end

  describe "Relation" do
    let(:category) { create(:category) }
    let(:products) { create_list(:product, 5, category: category) }

    it "has many products" do
      expect(category.products).to match_array products
    end
  end
end
