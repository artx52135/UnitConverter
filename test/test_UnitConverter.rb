# frozen_string_literal: true

require "test_helper"
require_relative '../lib/UnitConverter.rb'

class TestUnitConverter < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::UnitConverter::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
  # rlb roz rp rq rg ri
  def test_convertion_rlb
    assert replaceImperialUnit('2 фунта')=='900г.'
  end

def test_convertion_roz
    assert replaceImperialUnit('30 граммов')=='1унц.'
  end

def test_convertion_rp
    assert replaceImperialUnit('1 пинта')=='0.56мл.'
  end
  def test_convertion_rq
    assert replaceImperialUnit('2 кварты')=='2л.'
  end
  def test_convertion_rg
    assert replaceImperialUnit('1 галлон')=='4л.'
  end
  def test_convertion_ri
    assert replaceImperialUnit('2 дюйма')=='5см.'
  end
  #rl rk rgr rcm

  def test_convertion_rl
    assert replaceMetricUnit('1 литр')=='1кв.' and assert replaceMetriclUnit('4 литра')=='1гл.'
  end
  def test_convertion_rk
    assert replaceMetricUnit('0.9 килограмма')=='2фнт.'
  end
  def test_convertion_rgr
    assert replaceMetricUnit('30 граммов')=='1унц.'
  end
  def test_convertion_rcm
    assert replaceMetricUnit('5 сантиметров')=='2см.'
  end

end
