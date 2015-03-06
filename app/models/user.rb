# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  admin      :boolean
#

class User < ActiveRecord::Base

  scope :admin, -> {where(admin: true)}
  has_many :pins, dependent: :destroy
  has_many :boards, dependent: :destroy
end
