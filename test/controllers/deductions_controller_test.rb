require "test_helper"

class DeductionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get deductions_index_url
    assert_response :success
  end

  test "should get show" do
    get deductions_show_url
    assert_response :success
  end

  test "should get new" do
    get deductions_new_url
    assert_response :success
  end

  test "should get create" do
    get deductions_create_url
    assert_response :success
  end

  test "should get edit" do
    get deductions_edit_url
    assert_response :success
  end

  test "should get update" do
    get deductions_update_url
    assert_response :success
  end
end
