require "test_helper"

class PayslipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get payslips_index_url
    assert_response :success
  end

  test "should get show" do
    get payslips_show_url
    assert_response :success
  end

  test "should get new" do
    get payslips_new_url
    assert_response :success
  end

  test "should get create" do
    get payslips_create_url
    assert_response :success
  end

  test "should get edit" do
    get payslips_edit_url
    assert_response :success
  end

  test "should get update" do
    get payslips_update_url
    assert_response :success
  end
end
