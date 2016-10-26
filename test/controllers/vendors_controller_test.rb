require 'test_helper'

class VendorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show_vendor" do
    get :show_vendor
    assert_response :success
  end

  test "should get new_product" do
    get :new_product
    assert_response :success
  end

  test "should get create_product" do
    get :create_product
    assert_response :success
  end

  test "should get show_product" do
    get :show_product
    assert_response :success
  end

  test "should get show_all_products" do
    get :show_all_products
    assert_response :success
  end

  test "should get update_product" do
    get :update_product
    assert_response :success
  end

  test "should get edit_product" do
    get :edit_product
    assert_response :success
  end

  test "should get delete_product" do
    get :delete_product
    assert_response :success
  end

  test "should get new_sale" do
    get :new_sale
    assert_response :success
  end

  test "should get create_sale" do
    get :create_sale
    assert_response :success
  end

  test "should get show_sale" do
    get :show_sale
    assert_response :success
  end

  test "should get show_all_sales" do
    get :show_all_sales
    assert_response :success
  end

  test "should get total_sales" do
    get :total_sales
    assert_response :success
  end

end
