class CartesianProduct
  include Enumerable

  # YOUR CODE HERE
  def initialize(arr_1,arr_2)
    @arr_1 = arr_1
    @arr_2 = arr_2
  end
  
  attr_accessor:arr_1
  attr_accessor:arr_2
  
  def each(&block)
    @arr_1.each do |arr_1|
      @arr_2.each do |arr_2|
        block.call([arr_1,arr_2])
      end
    end
  end

end

