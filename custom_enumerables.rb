# frozen_string_literal: false

# Add methods to Enumerable module
module Enumerable
  # Create #my_each, a method that is identical to #each but (obviously)
  # does not use #each. You’ll need to use a yield statement. Make sure it
  # returns the same thing as #each as well.
  def my_each
    return nil unless block_given?

    for item in self
      yield item
    end
    self
  end

  # Create #my_each_with_index in the same way.
  def my_each_with_index
    return nil unless block_given?

    index = 0
    for item in self
      yield item, index
      index += 1
    end
    self
  end

  # Create #my_select in the same way, though you may use #my_each in your
  # definition (but not #each).
  def my_select
    return nil unless block_given?

    if self.kind_of?(Array)
      pass = []
      for item in self
        if yield item
          pass << item
        end
      end
    else
      pass = {}
      for key, value in self
        if yield key, value
          pass[key] = value
        end
      end
    end

    pass
  end

  # Create #my_all? (continue as above)
  def my_all?
    return nil unless block_given?

    for item in self
      if yield item
        next
      else
        return false
      end
    end
    true
  end

  # Create #my_any?
  # Passes each element of the collection to the given block. 
  # The method returns true if the block ever returns a value 
  # other than false or nil.
  def my_any?
    return nil unless block_given?

    for item in self
      return true if yield item
    end
    false
  end

  # Create #my_none?

  # Create #my_count

  # Create #my_map

  # Create #my_inject

  # Test your #my_inject by creating a method called #multiply_els
  # which multiplies all the elements of the array together by using
  # my_inject, e.g. multiply_els([2,4,5]) #=> 40

  # Modify your #my_map method to take a proc instead.

  # Modify your #my_map method to take either a proc or a block.
  # It won’t be necessary to apply both a proc and a block in the same
  # my_map call since you could get the same effect by chaining together
  # one #my_map call with the block and one with the proc.
  # This approach is also clearer, since the user doesn’t have to remember
  # whether the proc or block will be run first. So if both a proc and
  # a block are given, only execute the proc.

end

