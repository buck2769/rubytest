class Calculator
  attr_accessor :total
  
  def initialize
    @total = 0
    self
  end
  
  def add(numbers)
    # parse numbers

    if numbers.empty?
      # output current total
      output_total
      return 
    end
    
    # give me an array
    numbers = numbers.split(',').collect{ |number| number.chomp.to_i }
    
    # now store the total
    @total = numbers.reduce(@total){ |sum, number| sum += number }
    output_total
  end
  
  private
  def output_total
    puts "current total is #{@total}"
  end
end