# frozen_string_literal

module AssessmentsHelper
  def average_assessment(assessments)
    return "no rating" if assessments.empty?

    amount = assessments.map(&:stars).inject(&:+)
    (amount.to_f / assessments.count).round(1)
  end
end
