# == Schema Information
#
# Table name: news
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  image       :string
#  url         :string
#  media       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :bigint(8)
#

require 'rails_helper'

RSpec.describe New, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
