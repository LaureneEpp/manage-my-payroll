require "application_system_test_case"

class EmployeesTest < ApplicationSystemTestCase
  setup do
    @employee = employees(:one)
  end

  test "visiting the index" do
    visit employees_url
    assert_selector "h1", text: "Employees"
  end

  test "should create employee" do
    visit employees_url
    click_on "New employee"

    fill_in "Create", with: @employee.create
    fill_in "Destroy", with: @employee.destroy
    fill_in "Edit", with: @employee.edit
    fill_in "Index", with: @employee.index
    fill_in "New", with: @employee.new
    fill_in "Show", with: @employee.show
    fill_in "Update", with: @employee.update
    click_on "Create Employee"

    assert_text "Employee was successfully created"
    click_on "Back"
  end

  test "should update Employee" do
    visit employee_url(@employee)
    click_on "Edit this employee", match: :first

    fill_in "Create", with: @employee.create
    fill_in "Destroy", with: @employee.destroy
    fill_in "Edit", with: @employee.edit
    fill_in "Index", with: @employee.index
    fill_in "New", with: @employee.new
    fill_in "Show", with: @employee.show
    fill_in "Update", with: @employee.update
    click_on "Update Employee"

    assert_text "Employee was successfully updated"
    click_on "Back"
  end

  test "should destroy Employee" do
    visit employee_url(@employee)
    click_on "Destroy this employee", match: :first

    assert_text "Employee was successfully destroyed"
  end
end
