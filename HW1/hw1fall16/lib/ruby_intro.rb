# When done, submit this entire file to the ICON HW1 Dropbox.

# Part 1

def sum arr
  # YOUR CODE HERE
  sum_of_arr = 0
  if !arr.empty? 
    # one line code for doint this arr.each {|x| sum_of_arr += x}
    for element in arr # use the for loop to do this
      sum_of_arr += element
    end
  end
  return sum_of_arr
end

def max_2_sum arr
  # YOUR CODE HERE
  sum_of_2 = 0
  
  if !arr.empty?
    num_1 = arr[0]
    if arr.size > 2
      num_2 = arr[1]
      if num_1 < num_2 
        num_1 += num_2
        num_2 = num_1 - num_2
        num_1 -= num_2
      end
      for element in arr[2..-1]
        if element > num_1
          num_2 = num_1
          num_1 = element
        elsif element > num_2
          num_2 = element
        end
      end
    else
      num_2 = 0
    end
    sum_of_2 = num_2 + num_1
  end
  return sum_of_2
end

def sum_to_n? arr, n
  # YOUR CODE HERE
  if !arr.empty? 
    for i in (0..arr.size-1)
      for j in (i+1..arr.size-1)
        if n == arr[i]+arr[j]
          return true
        end
      end
    end
  end
  return false
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  return "Hello, "+name
end

def starts_with_consonant? s
  # YOUR CODE HERE
  if (s[0] =~ /[[:alpha:]]/)
    consonant_list = ["A", "E", "I", "O", "U"]
    return !consonant_list.include?(s[0].upcase)
  end
  return false
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
  if !s.empty?
    for i in (0..s.size-1)
      if !(s[i] =~ /[0-1]/)
        return false
      end
    end
    digit_count = s.size - 1
    sum_of_digit = 0
    for i in (0..s.size-1)
      if s[i] == "1"
        sum_of_digit += 2**digit_count
      end
      digit_count -= 1
    end
    if sum_of_digit%4 == 0
      return true
    end
  end
  return false
end

# Part 3

class BookInStock
  # YOUR CODE HERE
  # The constructor with `ArgumentError
  def initialize (isbn, price)
    raise ArgumentError, "First argument should be a nonemptyString!" unless (isbn.is_a? (String)) && !isbn.empty?
    raise ArgumentError, "Second argument should be a number GREATER than ZERO!" unless (price.is_a? Numeric) && (price>0)
    @isbn = isbn
    @price = price 
  end
  
  #Setter functions
  def isbn= isbn
    #@isbn = isbn
    initialize(isbn,@price)
  end
  def price= price
    #@price = price
    initialize(@isbn,price)
  end
  
  #Getter functions
  def isbn
    @isbn
  end
  def price
    @price
  end
  
  #Get the price in formatted string
  def price_as_string
    price_in_String = "$"
    price_in_String += (@price * 100).round.to_s
    price_in_String.insert(-3,".")
    return price_in_String
  end

end
