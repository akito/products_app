require 'spec_helper'

RSpec.describe Ownable do
  let(:like) { create :like }
  describe '#owned_by?' do
    it 'should be true when product is owned by user' do
      expect(like.owned_by?(like.user)).to be true
    end
  end
end
