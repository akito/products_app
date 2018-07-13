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
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name, email, password' do
    user = User.new(
      name: 'user',
      email: 'user@test.com',
      password: 'usrpassword')
    expect(user.valid?).to be_truthy
  end

  it 'is invalid without a name' do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without an email address' do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid with a duplicate name' do
    User.create(
      name: 'user',
      email: 'user@test.com',
      password: 'usrpassword'
    )
    user = User.new(
      name: 'user',
      email: 'user02@test.com',
      password: 'usrpassword'
    )
    user.valid?
    expect(user.errors[:name]).to include("has already been taken")
  end

  it 'is invalid with a duplicate email address' do
    User.create(
      name: 'user',
      email: 'user@test.com',
      password: 'usrpassword'
    )
    user = User.new(
      name: 'user02',
      email: 'user@test.com',
      password: 'usrpassword'
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it 'is invalid user name with 16 or more characters' do
    user = User.new(
      name: "a" * 16,
      email: 'user@test.com',
      password: 'usrpassword')
    user.valid?
    expect(user.valid?).to be_falsey
  end
  it 'is invalid user name with 2 or less characters' do
    user = User.new(
      name: "a" * 2,
      email: 'user@test.com',
      password: 'usrpassword')
    user.valid?
    expect(user.valid?).to be_falsey
  end

  it 'is invalid user name with symbols that can not be used' do
    user = User.new(
      name: "a1$!@",
      email: 'user@test.com',
      password: 'usrpassword')
    user.valid?
    expect(user.valid?).to be_falsey
  end

end
