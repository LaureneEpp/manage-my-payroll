require "test_helper"

class PayslipAllowancesControllerTest < ActionDispatch::IntegrationTest
  test "should get delete" do
    get payslip_allowances_delete_url
    assert_response :success
  end
end
