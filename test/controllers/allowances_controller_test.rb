require "test_helper"

class AllowancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get allowances_index_url
    assert_response :success
  end

  test "should get show" do
    get allowances_show_url
    assert_response :success
  end

  test "should get new" do
    get allowances_new_url
    assert_response :success
  end

  test "should get create" do
    get allowances_create_url
    assert_response :success
  end

  test "should get edit" do
    get allowances_edit_url
    assert_response :success
  end

  test "should get update" do
    get allowances_update_url
    assert_response :success
  end
end
