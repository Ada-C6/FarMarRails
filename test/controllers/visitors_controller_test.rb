require 'test_helper'

class VisitorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show_markets" do
    get :show_markets
    assert_response :success
  end

  test "should get show_vendors" do
    get :show_vendors
    assert_response :success
  end

  test "should get show_products" do
    get :show_products
    assert_response :success
  end

  test "should get show_markets_by_product" do
    get :show_markets_by_product
    assert_response :success
  end

end
