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
#  role                   :integer          default("user"), not null
#  uid                    :string
#  provider               :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  migration              :string
#  avatar                 :string
#  bio                    :string
#

class User < ApplicationRecord
  attr_accessor :login
  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false }

  validates_format_of :name, with: /\A[a-zA-Z0-9_\-. ]{3,15}\z/, message: "アルファベット,数字,.,-,_ が利用できます", multiline: true
  validate :validate_name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: %i(facebook)

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  enum role: { user: 0, admin: 1 }

  mount_uploader :avatar, AvatarUploader

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.provider = auth.provider
      user.avatar = auth.info.image
    end
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.name || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    conditions[:email].downcase! if conditions[:email]
    login = conditions.delete(:login)

    where(conditions.to_hash).where(
      ["lower(name) = :value OR lower(email) = :value",
       { value: login.downcase }]
    ).first
  end

  def validate_name
    errors.add(:name, :invalid) if User.where(email: name).exists?
  end

  def send_device_notification(notification, *args)
    device_mailer.send(notification, self, *args).deliver_later
  end
end
