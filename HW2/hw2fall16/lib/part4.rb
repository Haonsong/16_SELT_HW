class Class

  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    attr_reader attr_name        # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q"
      #Create the attribute's setter use metaprogramming
      def #{attr_name}= (data)
        @#{attr_name} = data
        if (! defined? @#{attr_name}_history) then
          @#{attr_name}_history = [nil]
        end
        @#{attr_name}_history.push(@#{attr_name})
      end
    "
    #"YOUR CODE HERE, USE %Q FOR MULTILINE STRINGS"


  end
end
