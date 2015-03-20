require 'test_helper'

class PinsControllerTest < ActionController::TestCase
  setup do
    @pin = pins(:one)
    cookies[:current_user_id] = users(:one).id
    @searchpins = Pin.search(params[:search]).order("created_at DESC")
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pin" do
    assert_difference('Pin.count') do
      post :create, pin: { description: @pin.description, pinimage: @pin.pinimage, title: @pin.title, url: @pin.url }
    end

    assert_redirected_to pin_path(assigns(:pin))
  end

  test "should show pin" do
    get :show, id: @pin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pin
    assert_response :success
  end

  test "should update pin" do
    patch :update, id: @pin, pin: { description: @pin.description, pinimage: @pin.pinimage, title: @pin.title, url: @pin.url }
    assert_redirected_to pin_path(assigns(:pin))
  end

  test "should destroy pin" do
    assert_difference('Pin.count', -1) do
      delete :destroy, id: @pin
    end

  test "index view correct" do
    get :index
    assert_template :index
    assert_template layout: "layouts/application"
  end

  test "search index" do
    get params[:search]
    assert_template :index
  end

  test "search works" do
    get(:index, {:search => 'X'})
    assert_template :index
    assert_equal @searchpins, pins(:two)
  end

    assert_redirected_to pins_path
  end

  class PinsRoutesTest < ActionController::TestCase
    test "should route to pin" do
      assert_routing '/pins/1', { controller: "pins", action: "show", id: "1" }
    end
  end

end
