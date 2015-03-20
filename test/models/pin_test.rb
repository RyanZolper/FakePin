# == Schema Information
#
# Table name: pins
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  board_id    :integer
#  pinimage    :string
#

require 'test_helper'

class PinTest < ActiveSupport::TestCase
  test "Pin needs title, pinimage and user_id" do
    pin = Pin.new
    assert_not pin.save, "Saved pin without required attrs"
  end
end
