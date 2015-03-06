# == Schema Information
#
# Table name: pins
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  url         :string
#  pin_image   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  board_id    :integer
#  pinimage    :string
#

class Pin < ActiveRecord::Base
  scope :mypins, -> { where(user_id: 1)}
  scope :noimage, -> { where(pinimage: "")}
  belongs_to :board, inverse_of: :pins
  belongs_to :user, inverse_of: :pins
  mount_uploader :pinimage, PinimageUploader

  before_create do
    self.user_id ||= 1
  end

  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
