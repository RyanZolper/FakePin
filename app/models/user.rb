# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  admin           :boolean
#

class User < ActiveRecord::Base

  validates :name, :email, :password_digest, presence: true
  scope :admin, -> {where(admin: true)}
  has_many :pins, dependent: :destroy, inverse_of: :user
  has_many :boards, dependent: :destroy
  has_secure_password
end
