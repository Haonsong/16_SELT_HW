class Dessert

  def initialize(name, calories)
    # YOUR CODE HERE
    @name = name
    @calories = calories
   
  end
  
  def healthy?
    # YOUR CODE HERE
    return @calories < 200
  end
  
  def delicious?
    # YOUR CODE HERE
    return true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    # YOUR CODE HERE
    @name = name
    @calories = calories
    @flavor = flavor
  end
  
  attr_accessor :name
  attr_accessor :calories
  attr_accessor :namflavore
  
  def delicious?
    # YOUR CODE HERE
    if @flavor == "black licorice" then
      return false
    else
      return true
    end
  end
end
