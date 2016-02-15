require 'byebug'
class Employee
  attr_reader :employee_name, :employee_review, :employee_email_address, :employee_phone_number
  attr_accessor :employee_salary,  :employee_satisfaction

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
    negative_found = []
    positive_found = []
    negative_words = [/discussed/, /concerns/, /performance/,
    /improvement/, /technically/, /but/, /expected/, /negative/, /not/, /inadequate/]
    negative_words.each do |w|
      negative_found = @employee_review.scan(w)
    end

    negative_count = negative_found.length * -1

    positive_words = [/asset/, /pleaseure/, /always/, /help/, /ownership/, /work/,
    /effective/, /developer/, /workload/]
    positive_words.each do |w|
      positive_found = @employee_review.scan(w)
    end
# byebug
    positive_count = positive_found.length
    the_verdict_is = positive_count + negative_count
    @employee_satisfaction =  true if the_verdict_is >= 0
    @employee_satisfaction =  false if the_verdict_is < 0


  end
end
