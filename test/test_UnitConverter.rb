# frozen_string_literal: true

require "test_helper"
require_relative '../lib/UnitConverter.rb'

def test_that_it_has_a_version_number
  refute_nil ::UnitConverter::VERSION
end

def test_it_does_something_useful
  assert false
end
# rlb roz rp rq rg ri rflu rft
def test_convertion_rlb
  assert replace_imperial_units('5 pounds')=='2.25 kilograms'
end
def test_convertion_roz
  assert replace_imperial_units('10 ounces')=='300.0 grams'
end
def test_convertion_rp
  assert replace_imperial_units('50 inches')=='125.0 centimeters'
end
def test_convertion_rq
  assert replace_imperial_units('2 quarts')=='2.0 liters'
end
def test_convertion_rg
  assert replace_imperial_units('1 gallon')=='4.0 liters'
end
def test_convertion_ri
  assert replace_imperial_units('50 inches')=='125.0 centimeters'
end
def test_convertion_rflu
  assert replace_imperial_units('20 fl ounces')=='600.0 grams'
end
def test_convertion_rft
  assert replace_imperial_units('6 feet')=='1.83 meters'
end


#rl rml rk rgr rcm rm

def test_convertion_rl
  assert replace_metric_units('1 liter')=='1 quarts' and replace_metric_units('4 liters')=='1.0 gallons'
end
def test_convertion_rk
  assert replace_metric_units("18 kilograms")=="40.0 pounds"
end
def test_convertion_rgr
  assert replace_metric_units('500 grams')=='16.67 ounces'
end
def test_convertion_rcm
  assert replace_metric_units('98 centimeters')=='39.2 inches'
end
def test_convertion_rm
  assert replace_metric_units('2 meters')=='6.56 feet'
end
def test_convertion_rml
  assert replace_metric_units('100 milliliters')=='3.33 fl ounces'
end
