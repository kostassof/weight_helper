require 'active_model'

class WeightHelper
  include ActiveModel::Validations

  def initialize(weight, height)
    @weight = weight
    @height = height
  end

  def self.calculate(weight, height)
    measurements = new(weight, height)
    return nil unless measurements.valid?

    measurements.send(:bmi)
  end

  def self.bmi_category(weight, height)
    measurements = new(weight, height)
    return nil unless measurements.valid?

    measurements.send(:bmi_category)
  end

  private

  attr_reader :weight, :height

  validates_numericality_of :weight, only_numeric: true, greater_than: 0
  validates_numericality_of :height, only_numeric: true, greater_than: 0

  def bmi
    weight / height**2
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
