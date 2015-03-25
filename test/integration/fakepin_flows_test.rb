require 'test_helper'

class FakepinFlowsTest < ActionDispatch::IntegrationTest

  fixtures :users, :pins

  setup do
  end

  test "nav links" do
    post '/users/login', {"user"=>{"email"=>"MyString", "password"=>"pwd"}}
    get '/pins/index'
    assert_response :success
    assert_select 'a', 'My Pins', true
    assert_select 'a', 'My Boards', true
    assert_select 'a', 'FakePin', true
  end

  test "admin only" do
    post '/users/login', {"user"=>{"email"=>"MyString", "password"=>"pwd"}}
    get '/admin'
    assert_redirected_to pins_path
  end

  test "mypins works" do
    post '/users/login', {"user"=>{"email"=>"MyString", "password"=>"pwd"}}
    assert_recognizes({ controller: "pins", action: "index"}, '/pins/mypins')
    get '/pins/mypins'
    assert_not_equal Pin.all, @pins
  end

  test "mypins only" do

    get '/pins/mypins'
    assert_redirected_to root_path

  end

end
