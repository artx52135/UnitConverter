# frozen_string_literal: true

require "test_helper"
require_relative '../lib/UnitConverter.rb'

class UnitConverterTest < Minitest::Test
def test_that_it_has_a_version_number
  assert refute_nil ::UnitConverter::VERSION
end

def test_it_does_something_useful
  assert false
end
# rlb roz rp rq rg ri rflu rft
def test_convertion_rlb
  assert Converter.new('7 pounds').find_and_replace_imperial_units=='3.15 kilograms'
end
def test_convertion_roz
  assert Converter.new('12 ounces').find_and_replace_imperial_units=='360.0 grams'
end
def test_convertion_rp
  assert Converter.new('2 pints').find_and_replace_imperial_units=='1120.0 milliliters'
end
def test_convertion_rq
  assert Converter.new('173 quarts').find_and_replace_imperial_units=='173.0 liters'
end
def test_convertion_rg
  assert Converter.new('1 gallon').find_and_replace_imperial_units=='4.0 liters'
end
def test_convertion_ri
  assert Converter.new('50 inches').find_and_replace_imperial_units=='125.0 centimeters'
end
def test_convertion_rflu
  assert Converter.new('20 floz').find_and_replace_imperial_units=='600.0 milliliters'
end
def test_convertion_rft
  assert Converter.new('6 feet').find_and_replace_imperial_units=='1.83 meters'
end

#rl rml rk rgr rcm rm
def test_convertion_rl
  assert Converter.new('1 liter').find_and_replace_metric_units=='1 quarts' and Converter.new('4 liters').find_and_replace_metric_units=='1.0 gallons'
end
def test_convertion_rk
  assert Converter.new("18 kilograms").find_and_replace_metric_units=="40.0 pounds"
end
def test_convertion_rgr
  assert Converter.new('500 grams').find_and_replace_metric_units=='16.67 ounces'
end
def test_convertion_rcm
  assert Converter.new('98 centimeters').find_and_replace_metric_units=='39.2 inches'
end
def test_convertion_rm
  assert Converter.new('2 meters').find_and_replace_metric_units=='6.56 feet'
end
def test_convertion_rml
  assert Converter.new('100 milliliters').find_and_replace_metric_units=='3.33 fl ounces'
end
end
