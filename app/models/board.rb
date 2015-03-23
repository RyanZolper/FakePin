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
  belongs_to :pin, inverse_of: :boards
  has_many :pins, dependent: :destroy

end
