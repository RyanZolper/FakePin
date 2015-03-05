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
#  pinimage   :string
#

class User < ActiveRecord::Base
  has_many :pins, dependent: :destroy
  has_many :boards, dependent: :destroy
end
