require 'minitest/autorun'
require 'minitest/pride'
#require 'byebug'


#Note: This line is going to fail first.
require './employee_review.rb'

class EmployeesReviewsTest < Minitest::Test

  def test_01_department_class_exists
    assert Department
    a = Department.new("Widgets")
    assert a
    assert_equal "Widgets", a.department_name
  end

  def test_02_employee_class_exists
    assert Employee
    e = Employee.new("Greg", "Greg@yahoo.com", 7179991111, 100000.00)
    assert e
    assert_equal "Greg", e.employee_name
    assert_equal "Greg@yahoo.com", e.employee_email_address
    assert_equal 7179991111, e.employee_phone_number
    assert_equal 100000.00, e.employee_salary

  end

  def test_03_Employee_Added_To_Department
   d = Department.new("Blidgets")
   e = Employee.new("Greg", "Greg@yahoo.com", 7179991111, 100000.00)
   d.add_employee(e)
   assert_equal [e], d.employees
  end

  def test_04_Get_an_Employees_Name
    assert e = Employee.new("Greg", "Greg@yahoo.com", 7179991111, 100000.00)
    assert_equal "Greg", e.employee_name
  end

  def test_05_Get_an_Employees_Salary
    assert e = Employee.new("Greg", "Greg@yahoo.com", 7179991111, 100000.00)
    assert_equal 100000.00, e.employee_salary
  end




end
