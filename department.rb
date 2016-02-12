class Department
  attr_reader :department_name, :employees

  def initialize(department_name)
    @department_name = department_name
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def department_salary
    sum = 0
    @employees.each {|d| sum += d.employee_salary}
    sum
  end

end
