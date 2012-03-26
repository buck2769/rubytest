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
  
  def test_line_breaks_for_delimters
    assert_equal 300, @calc.Add("150\n70,80")
  end
  
  def test_bad_line_breaks
    assert_raise StandardError do
      @calc.Add("150,\n7")
    end
    
    assert_raise StandardError do
      @calc.Add("150\n,400")
    end
  end
  
  def test_custom_delimeter
    assert_equal 50, @calc.Add("//whatwhat\n10whatwhat40")
    assert_equal 35, @calc.Add("//;\n17;18")
  end
end