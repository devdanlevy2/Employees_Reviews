class Department
  attr_reader :department_name, :employees

  def initialize(department_name)
    @department_name = department_name
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

end
