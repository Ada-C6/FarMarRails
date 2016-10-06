require 'test_helper'

class MarketsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get vendor_index" do
    get :vendor_index
    assert_response :success
  end

  test "should get vendor_show" do
    get :vendor_show
    assert_response :success
  end

  test "should get vendor_new" do
    get :vendor_new
    assert_response :success
  end

  test "should get vendor_create" do
    get :vendor_create
    assert_response :success
  end

  test "should get vendor_edit" do
    get :vendor_edit
    assert_response :success
  end

  test "should get vendor_update" do
    get :vendor_update
    assert_response :success
  end

  test "should get vendor_destroy" do
    get :vendor_destroy
    assert_response :success
  end

end
