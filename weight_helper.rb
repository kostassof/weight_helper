require 'active_model'

class WeightHelper
  include ActiveModel::Validations

  def initialize(weight, height)
    @weight = weight
    @height = height
  end

  attr_reader :weight, :height

  def self.calculate(weight, height)
    measurements = new(weight, height)
    return nil unless measurements.valid?

    measurements.send(:bmi).round(1)
  end

  def self.bmi_category(weight, height)
    measurements = new(weight, height)
    return nil unless measurements.valid?

    measurements.send(:bmi_category)
  end

  private

  validates_numericality_of :weight, only_numeric: true, greater_than: 0
  validates_numericality_of :height, only_numeric: true, greater_than: 0

  def bmi
    # Height needs to be converted to meters
    converted_height = height / 100.to_f

    weight / converted_height**2
  end

  def bmi_category
    if bmi < 18.5
      'Underweight'
    elsif bmi >= 18.5 && bmi < 25
      'Normal weight'
    elsif bmi >= 25 && bmi < 30
      'Overweight'
    else
      'Obese'
    end
  end
end
