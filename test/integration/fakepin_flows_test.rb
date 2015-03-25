require 'test_helper'

class FakepinFlowsTest < ActionDispatch::IntegrationTest

  setup do
    cookies[:current_user_id] = users(:one).id
  end

  test "nav links" do
    get '/pins/index'
    assert_response :success
    assert_select 'a', 'My Pins', true
    assert_select 'a', 'My Boards', true
    assert_select 'a', 'FakePin', true
  end

  test "admin only" do
    get '/admin'
    assert_redirected_to pins_path
  end

  test "mypins only" do
    assert_recognizes({ controller: "pins", action: "index"}, '/pins/mypins')
    get '/pins/mypins'
    assert_not_equal Pin.all, @pins

    get '/pins/mypins', nil, { "HTTP_COOKIE" => "current_user_id=nil"}
    assert_redirected_to root_path

  end

end
