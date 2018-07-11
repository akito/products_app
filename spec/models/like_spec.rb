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
#
# RSpec.describe Like, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
