# frozen_string_literal

module AssessmentsHelper
  def average_assessment(assessments)
    amount = 0
    assessments.each do |assessment|
      amount += assessment.stars
    end
    amount.to_f / assessments.count
  end
end
