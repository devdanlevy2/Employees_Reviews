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

  # def test_02_employee_class_exists
  #   assert Employee
  #   e = Employee.new("Dave", "Dave@gmail.com", 9195555555, 75000)
  #   assert e
  #   assert_equal "Dave", e.employee_name
  #   assert_equal "Dave@gmail.com", e.employee_email_address
  #   assert_equal 9195555555, e.employee_phone_number
  #   assert_equal 75000, e.employee_salary
  #
  # end
end
