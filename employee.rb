class Employee
  attr_reader :employee_name, :employee_email_address, :employee_phone_number, :employee_salary, :employee_review


  def initialize(employee_name: nil, employee_email_address: nil, employee_phone_number: nil, employee_salary: nil, employee_review: nil)
    @employee_name = employee_name
    @employee_email_address = employee_email_address
    @employee_phone_number = employee_phone_number
    @employee_salary  = employee_salary
    @employee_review = employee_review
  end


end
