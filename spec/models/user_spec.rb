# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  role                   :integer          default(0), not null
#  provider               :string
#  uid                    :string
#  username               :string
#

require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { create(:user) }

  it 'is valid with a name, email, password' do
    expect(user.valid?).to be true
  end

  it 'is invalid without a name' do
    user.name = nil
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without an email address' do
    user.email = nil
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end


  it 'is invalid with a duplicate name' do
    overlap_name = build(:user, name: user.name)
    overlap_name.valid?
    expect(overlap_name.errors[:name]).to include('has already been taken')
  end

  it 'is invalid with a duplicate email address' do
    overlap_email = build(:user, email: user.email)
    overlap_email.valid?
    expect(overlap_email.errors[:email]).to include('has already been taken')
  end

  it 'is invalid user name with 16 or more characters' do
    user.name = 'a' * 16
    user.valid?
    expect(user.valid?).to be false
  end

  it 'is invalid user name with 2 or less characters' do
    user.name = 'a' * 2
    user.valid?
    expect(user.valid?).to be false
  end

  it 'is invalid user name with symbols that can not be used' do
    user.name = 'a1$!@'
    user.valid?
    expect(user.valid?).to be false
  end
end
