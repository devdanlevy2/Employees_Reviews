require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

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

  def test_07_departments_total_salary
    d = Department.new("Blidgets")
    e = Employee.new(employee_name:"Greg", employee_email_address:"Greg@yahoo.com", employee_phone_number:"7179991111", employee_salary:100000.00)
    f = Employee.new(employee_name:"Greg", employee_email_address:"Greg@yahoo.com", employee_phone_number:"7179991111", employee_salary:300000.00)
    d.add_employee(e)
    d.add_employee(f)
    assert_equal 400000.00, d.department_salary
  end

  def test_08_employee_review
    e = Employee.new(employee_name: "Greg", employee_email_address: "Greg@yahoo.com", employee_phone_number: "7179991111", employee_salary: 100000.00, employee_review: "NEGATIVE REVIEW 1:
    Zeke is a very positive person and encourages those around him, but he has not done well technically this year.  There are two areas in which Zeke has room for improvement.  First,
    when communicating verbally (and sometimes in writing), he has a tendency to use more words than are required.  This conversational style does put people at ease, which is valuable,
    but it often makes the meaning difficult to isolate, and can cause confusion.
    Second, when discussing new requirements with project managers, less of the information is retained by Zeke long-term than is expected.  This has a few negative co")

    f = Employee.new(employee_name: "Greg", employee_email_address: "Greg@yahoo.com", employee_phone_number: "7179991111", employee_salary: 100000.00, employee_review: "POSITIVE REVIEW 1:
    Xavier is a huge asset to SciMed and is a pleasure to work with.  He quickly knocks out tasks assigned to him, implements code that rarely needs to be revisited, and is always willing
    to help others despite his heavy workload.  When Xavier leaves on vacation, everyone wishes he didn't have to go
    Last year, the only concerns with Xavier performance were around ownership.  In the past twelve months, he has successfully taken full ownership of both Acme and Bricks, Inc.  Aside from
    some false starts with estimates on Acme, clients are happy with his work and responsiveness, which is everything that his managers could ask for")
    assert e
    assert f
    refute_equal "", e.employee_review
    refute_equal "", f.employee_review
  end

  def test_09_satisfactory_or_no
    e = Employee.new(employee_name: "Greg", employee_email_address: "Greg@yahoo.com",
    employee_phone_number: "7179991111", employee_salary: 100000.00, employee_satisfaction: "false",
    employee_review: "NEGATIVE REVIEW 1: Zeke is a very positive person and encourages those around
    him, but he has not done well technically this year.  There are two areas in which Zeke has room
    for improvement.  First, when communicating verbally (and sometimes in writing), he has a tendency
    to use more words than are required.  This conversational style does put people at ease, which is
    valuable, but it often makes the meaning difficult to isolate, and can cause confusion. Second,
    when discussing new requirements with project managers, less of the information is retained by Zeke
    long-term than is expected.  This has a few negative co")

    f = Employee.new(employee_name: "Greg", employee_email_address: "Greg@yahoo.com",
    employee_phone_number: "7179991111", employee_salary: 100000.00, employee_satisfaction: "true",
    employee_review: "POSITIVE REVIEW 1: Xavier is a huge asset to SciMed and is a pleasure to work
    with.  He quickly knocks out tasks assigned to him, implements code that rarely needs to be
    revisited, and is always willing to help others despite his heavy workload.  When Xavier
    leaves on vacation, everyone wishes he didn't have to go Last year, the only concerns with
    Xavier performance were around ownership.  In the past twelve months, he has successfully
    taken full ownership of both Acme and Bricks, Inc.  Aside from some false starts with estimates
    on Acme, clients are happy with his work and responsiveness, which is everything that his
    managers could ask for")

    assert e
    assert f
    assert_equal "false", e.employee_satisfaction
    assert_equal "true", f.employee_satisfaction
  end

  def test_10_employee_raise
    f = Employee.new(employee_name: "Greg", employee_email_address: "Greg@yahoo.com",
    employee_phone_number: "7179991111", employee_salary: 100000.00, employee_satisfaction: "true",
    employee_review: "POSITIVE REVIEW 1: Xavier is a huge asset to SciMed and is a pleasure to work with.
    He quickly knocks out tasks assigned to him, yeah, yeah, he's awesome")
    assert_equal 110000.00, f.employee_raise(0.10)
  end

  def test_11_department_raises

    e = Employee.new(employee_name: "Greg", employee_email_address: "Greg@yahoo.com",
    employee_phone_number: "7179991111", employee_salary: 80000.00, employee_satisfaction: true,
    employee_review: "Wowsers, Greg is the bomb")
    f = Employee.new(employee_name: "Richard", employee_email_address: "Greg@yahoo.com",
    employee_phone_number: "7179991111", employee_salary: 90000.00, employee_satisfaction: true,
    employee_review: "Hey Bud, Richard brings donuts every thursday!")
    g = Employee.new(employee_name: "Danny", employee_email_address: "Greg@yahoo.com",
    employee_phone_number: "7179991111", employee_salary: 80000.00, employee_satisfaction: false,
    employee_review: "Oooh, Danny is always late and got everyone sick with the ebola!")

    d = Department.new("Blidgets")
    d.add_employee(e)
    d.add_employee(f)
    d.add_employee(g)
    d.distribute_raises(20000.00)

    assert_in_delta 90000.00, e.employee_salary, 0.01
    assert_in_delta 100000.00, f.employee_salary, 0.01
    assert_in_delta 80000.00, g.employee_salary, 0.01
  end

  def test_12_modify_department_raises_method_using_blocks

    e = Employee.new(employee_name: "Greg", employee_email_address: "Greg@yahoo.com",
    employee_phone_number: "7179991111", employee_salary: 80000.00,
    employee_satisfaction: true, employee_review: "Wowsers, Greg is the bomb")

    f = Employee.new(employee_name: "Richard", employee_email_address: "Greg@yahoo.com",
    employee_phone_number: "7179991111", employee_salary: 90000.00, employee_satisfaction: true,
    employee_review: "Hey Bud, Richard brings donuts every thursday!")

    g = Employee.new(employee_name: "Danny", employee_email_address: "Greg@yahoo.com",
    employee_phone_number: "7179991111", employee_salary: 80000.00, employee_satisfaction: false,
    employee_review: "Oooh, Danny is always late and got everyone sick with the ebola!")

    d = Department.new("Blidgets")
    d.add_employee(e)
    d.add_employee(f)
    d.add_employee(g)
    d.department_block_raises(15000) {|i| i.employee_salary < 100000.00}
    assert_in_delta 85000.00, e.employee_salary, 0.01
    assert_in_delta 95000.00, f.employee_salary, 0.01
    assert_in_delta 85000.00, g.employee_salary, 0.01
    end

end
