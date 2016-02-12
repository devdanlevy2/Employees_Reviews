require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'


#Note: This line is going to fail first.
require './employee_review.rb'

class EmployeesReviewsTest < Minitest::Test

  def test_01_department_class_exists
    assert Department
    a = Department.new("Widgets")
    assert a
    assert_equal a.department_name, "Widgets"
  end

  def test_02_employee_class_exists
    assert Employee
    e = Employee.new(employee_name:"Greg", employee_email_address:"Greg@yahoo.com", employee_phone_number:"7179991111", employee_salary:100000.00)
    assert e
    assert_equal "Greg", e.employee_name
    assert_equal "Greg@yahoo.com", e.employee_email_address
    assert_equal "7179991111", e.employee_phone_number
    assert_equal 100000.00, e.employee_salary

  end

  def test_03_employee_added_to_department
   d = Department.new(department_name: "Blidgets")
   e = Employee.new(employee_name:"Greg", employee_email_address:"Greg@yahoo.com", employee_phone_number:"7179991111", employee_salary:100000.00)
   d.add_employee(e)
   assert_equal [e], d.employees
  end

  def test_04_get_an_employees_name
    e = Employee.new(employee_name:"Greg", employee_email_address:"Greg@yahoo.com", employee_phone_number:"7179991111", employee_salary:100000.00)
    assert e
    assert_equal e.employee_name, "Greg"
  end

  def test_05_get_an_employees_salary
    e = Employee.new(employee_name:"Greg", employee_email_address:"Greg@yahoo.com", employee_phone_number:"7179991111", employee_salary:100000.00)
    assert e
    assert_equal 100000.00, e.employee_salary
  end

  def test_06_get_a_departments_name
    d = Department.new("Blidgets")
    assert_equal "Blidgets", d.department_name
  end


end
