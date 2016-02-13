class Employee
  attr_reader :employee_name, :employee_email_address, :employee_phone_number, :employee_satisfaction
  attr_accessor :employee_review, :employee_salary

  def initialize(employee_name: nil, employee_email_address: nil, employee_phone_number: nil,
     employee_salary: nil, employee_review: nil, employee_satisfaction: nil)
    @employee_name = employee_name
    @employee_email_address = employee_email_address
    @employee_phone_number = employee_phone_number
    @employee_salary  = employee_salary
    @employee_review = employee_review
    @employee_satisfaction = employee_satisfaction
  end

  def employee_raise
    if employee_satisfaction = "true"
    @employee_salary = (@employee_salary * 1.1)
    end
  end


end
