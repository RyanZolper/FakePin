require 'test_helper'

class PinsControllerTest < ActionController::TestCase
  setup do
    @pin = pins(:one)
    session[:current_user_id] = users(:one).id
  end


  test "should get new" do
    get :new
    assert_response :success
  end


  test "should show pin" do
    get :show, id: @pin
    assert_response :success
  end




  test "index view correct" do
    get :index
    assert_template :index
    assert_template layout: "layouts/application"
  end

  test "search index" do
    get :index, {"utf8"=>"✓", :search=>"X"}
    assert_template :index
  end

  test "search works" do
    get :index, {"utf8"=>"✓", :search=>"X"}
    assert_not_nil @controller.params[:search]
    assert_equal Pin.search(@controller.params[:search]).order("created_at DESC").to_a, [pins(:two)]
  end


  class PinsRoutesTest < ActionController::TestCase
    test "should route to pin" do
      assert_routing '/pins/1', { controller: "pins", action: "show", id: "1" }
    end
  end

end
