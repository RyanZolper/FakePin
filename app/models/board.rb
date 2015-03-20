# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Board < ActiveRecord::Base
  validates :name, :user_id, presence: :true
  scope :myboards, -> { where(user_id: 1)}
  scope :addpin, -> { where(user_id: 1)}
  belongs_to :pin, inverse_of: :boards
  has_many :pins, dependent: :destroy
  before_create do
    self.user_id ||= 1
  end
end
