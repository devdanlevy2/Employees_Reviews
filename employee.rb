class Employee
  attr_reader :employee_name, :employee_email_address, :employee_phone_number, :employee_salary

  def initialize(employee_name:, employee_email_address:, employee_phone_number:, employee_salary:)
    @employee_name = employee_name
    @employee_email_address = employee_email_address
    @employee_phone_number = employee_phone_number
    @employee_salary  = employee_salary
  end


end
