# 1. Create a simple String calculator with a method Add(numbers) that takes a string
# --The method can take 0, 1 or 2 numbers, and will return their sum (for an empty string it will 
#   return 0) for example “” or “1” or “1,2”
# --Start with the simplest test case of an empty string and move to 1 and two numbers
#  
# 2. Allow the Add method to handle an unknown amount of numbers
#  
# 3. Allow the Add method to handle new lines between numbers (instead of commas).
# --the following input is ok: “1\n2,3” (will equal 6)
# --the following input is NOT ok: “1,\n”
# --Make sure you only test for correct inputs. there is no need to test for invalid inputs
#  
# 4. Allow the Add method to handle a different delimiter:
# -- to change a delimiter, the beginning of the string will contain a separate line that looks like 
#    this: “//[delimiter]\n[numbers…]” for example “//;\n1;2” should return three where the 
#    default delimiter is ‘;’ .
# -- the first line is optional. all existing scenarios should still be supported
#  
# 5. Calling Add with a negative number will throw an exception “negatives not allowed” – and 
#    the negative that was passed.if there are multiple negatives, show all of them in the exception message

class Calculator
  def Add(numbers)
    return 0 if numbers.empty?
    
    # look for custom delimeter
    if matches = numbers.match(/^\/\/(.+)$/)
      delimeter = matches[1]
      numbers = numbers.lines.to_a[1..-1].join
    else
      delimeter = ','
    end

    ints = numbers.split(/#{delimeter}{1}|\n{1}/)
    
    negatives = []
    total = ints.inject(0) do |sum, item|
      # check for negatives
      if item.match(/^\-{1}/)
        negatives << item
      end
      next unless negatives.empty?
      
      if !item.match(/^[0-9]+$/) or item.empty?
        raise StandardError, "number does not meet requirements in step 1"
      end
      sum += item.to_i
    end
    
    unless negatives.empty?
      raise StandardError, "There were #{negatives.length} negative(s).\n #{negatives.join("\n")}"
    end
    
    total
  end
end