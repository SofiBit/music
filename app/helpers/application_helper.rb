# frozen_string_literal: true

module ApplicationHelper

  def transform(result)
    array = []
    result.each do |k, v|
      array << "#{k.capitalize.gsub(/[_]/, ' ')}:%20#{v}"
    end
    array.join("%0A")
  end
end
