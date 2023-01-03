# frozen_string_literal: true

require "test_helper"
require_relative '../lib/UnitConverter.rb'

class UnitConverterTestMetric < Minitest::Test
  def test_that_it_has_a_version_number
    assert refute_nil ::UnitConverter::VERSION
  end

  def test_it_does_something_useful
    assert false
  end

  #rl rml rk rgr rcm rm
def test_convertion_rl
  assert Converter.new('5 liter').find_and_replace_metric_units=='5 quarts' and Converter.new('16 liters').find_and_replace_metric_units=='4.0 gallons'
end
def test_convertion_rk
  assert Converter.new("71 kilograms").find_and_replace_metric_units=="157.78 pounds"
end
def test_convertion_rgr
  assert Converter.new('310 grams').find_and_replace_metric_units=='10.33 ounces'
end
def test_convertion_rcm
  assert Converter.new('532 centimeters').find_and_replace_metric_units=='212.8 inches'
end
def test_convertion_rm
  assert Converter.new('4 meters').find_and_replace_metric_units=='13.11 feet'
end
def test_convertion_rml
  assert Converter.new('850 milliliters').find_and_replace_metric_units=='28.33 fl ounces'
end

end
