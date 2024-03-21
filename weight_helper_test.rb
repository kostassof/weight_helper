require 'minitest/autorun'
require_relative 'weight_helper'

class WeightHelperTest < Minitest::Test
  def test_calculate_bmi
    assert_equal 22.9, WeightHelper.calculate(70, 175)
    assert_equal 33.1, WeightHelper.calculate(90, 165)
    assert_nil WeightHelper.calculate(-70, 175) # Weight should be greater than 0
    assert_nil WeightHelper.calculate(70, -175) # Height should be greater than 0
    assert_nil WeightHelper.calculate('not_a_number', 175)
    assert_nil WeightHelper.calculate(70, 'not_a_number')
  end

  def test_bmi_category
    assert_equal 'Normal weight', WeightHelper.bmi_category(70, 175)
    assert_equal 'Obese', WeightHelper.bmi_category(90, 165)
    assert_nil WeightHelper.bmi_category(-70, 175) # Weight should be greater than 0
    assert_nil WeightHelper.bmi_category(70, -175) # Height should be greater than 0
    assert_nil WeightHelper.bmi_category('not_a_number', 175)
    assert_nil WeightHelper.bmi_category(70, 'not_a_number')
  end
end
