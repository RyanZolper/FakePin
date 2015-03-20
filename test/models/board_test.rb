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

require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  test "Board needs name and user_id" do
    board = Board.new
    assert_not board.save, "Saved board without required attrs"
  end
end
