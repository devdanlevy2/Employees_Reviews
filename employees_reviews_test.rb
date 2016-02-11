require 'minitest/autorun'
require 'minitest/pride'
#require 'byebug'


#Note: This line is going to fail first.
require './employee_review.rb'

class EmployeesReviewsTest < Minitest::Test

  def test_01_department_class_exists
    assert Department
  end

  def test_02_employee_class_exists
    assert Employee
  end

end
