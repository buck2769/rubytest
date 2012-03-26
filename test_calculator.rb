require "./calculator"
require "test/unit"

class TestAdd < Test::Unit::TestCase
  def setup
    @calc = Calculator.new
  end
  
  def test_initial_total
    
    assert_equal @calc.total, 0
  end
  
  def test_empty_string
    @calc.add("")
    
    assert_equal 0, @calc.total
  end
  
  def test_add_one_number
    @calc.add("3")
    assert_equal 3, @calc.total
    
    @calc.add("4")
    assert_equal 7, @calc.total
  end
  
  def test_add
    @calc.add("1,2")
    assert_equal 3, @calc.total
    
    @calc.add("7, 3")
    assert_equal 13, @calc.total
    
  end
end