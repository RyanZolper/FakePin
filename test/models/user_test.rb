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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "User needs name, email and pwd" do
    user = User.new
    assert_not user.save, "Saved user without required attrs"
  end
end
