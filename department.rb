require 'byebug'
class Department
  attr_reader :department_name, :employees, :satisfactory_employees

  def initialize(department_name)
    @department_name = department_name
    @employees = []
    @satisfactory_employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def department_salary
    sum = 0
    @employees.each {|d| sum += d.employee_salary}
    sum
  end

  def distribute_raises(raise_budget)
    @employees.each do |e|
    @satisfactory_employees << e if e.employee_satisfaction
    end
    @satisfactory_employees.each {|d| d.employee_salary += (raise_budget / @satisfactory_employees.length)}
  end


  def department_block_raises(raise_budget)
    raises_array = []
    @employees.each do |i|
      raises_array << yield(i)
      byebug
      raises_array.each {|i| i.employee_salary += raise_budget / @raises_array.length}
    end
  end
end
