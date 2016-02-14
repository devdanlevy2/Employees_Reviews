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

  def employee_raise(raise_percentage)
    @employee_salary = (@employee_salary * raise_percentage) + @employee_salary
  end

  def emp_comp_assessment
    negative_count = 0
      if @employees.employee_review.match(/"discussed", "concerns", "performance", "improvement", "technically", "but", "expected", "negative", "not", "inadequate"/)
        negative_count +=1
      end
    positive_count = 0
      if @employees.employee_review.match(/"asset", "pleasure", "always", "help", "ownership", "work", "effective", "developer", "workload"/)
        positive_count +=1
      end
  end
    if positive_count > negative_count
      @employee_satisfaction = true
    else
      @employee_satisfaction = false
    end
  end
end
