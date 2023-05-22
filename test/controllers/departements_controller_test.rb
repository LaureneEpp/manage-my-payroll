require "test_helper"

class DepartementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get departements_index_url
    assert_response :success
  end

  test "should get show" do
    get departements_show_url
    assert_response :success
  end
end
