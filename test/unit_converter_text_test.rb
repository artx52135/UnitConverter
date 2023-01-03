# frozen_string_literal: true

require "test_helper"
require_relative '../lib/UnitConverter.rb'

class UnitConverterTestText < Minitest::Test
  def test_that_it_has_a_version_number
    assert refute_nil ::UnitConverter::VERSION
  end

  def test_it_does_something_useful
    assert false
  end

  def test_imperial
    assert Converter.new('Информация 5 milliliters 3 liters water 2 meters была метрическая система 12 крокодилов 20 kilograms').find_and_replace_metric_units=='Информация 0.17 fl ounces 3 quarts water 6.56 feet была метрическая система 12 крокодилов 44.44 pounds'
  end
  
  def test_without_units
    assert Converter.new('I want to tell you important information').find_and_replace_imperial_units=='I want to tell you important information'
  end

  def test_metric
    assert Converter.new('5 веников 13 floz 21 feet рост и 12 pounds вес но 2 pounds и 1 ounce была имперская система').find_and_replace_imperial_units=='5 веников 390.0 milliliters 6.42 meters рост и 5.4 kilograms вес но 900.0 grams и 30.0 grams была имперская система'
  end

  def test_exist
    assert Converter.new('').find_and_replace_metric_units ==''
  end


end
