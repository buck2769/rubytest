require "./calculator"
require "test/unit"

class TestAdd < Test::Unit::TestCase
  def setup
    @calc = Calculator.new
  end
  
  def test_empty_string
    assert_equal 0, @calc.Add("")
  end
  
  def test_add
    assert_equal 7, @calc.Add("2,5")
  end
  
  def test_multiple_digit_numbers
    assert_equal 20, @calc.Add("12,8")
    assert_equal 1200, @calc.Add("348,852")
  end
  
  def test_2_or_more_numbers
    assert_equal 165, @calc.Add("1,3,5,56,100")
  end
end