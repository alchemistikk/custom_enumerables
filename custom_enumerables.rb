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
  def my_any?
    return nil unless block_given?

    for item in self
      return true if yield item
    end
    false
  end

  # Create #my_none? 
  def my_none?
    return nil unless block_given?

    for item in self
      return false if yield item
    end
    true
  end

  # Create #my_count
  def my_count(elem = nil)
    count = 0

    if elem.nil?
      for item in self
        count += 1 if yield item
      end
    else
      for item in self
        count += 1 if item == elem
      end
    end

    count
  end

  # Create #my_map
  def my_map(proc = nil)
    arr = []
    if proc
      for item in self
        arr << proc.call(item)
      end
    elsif block_given?
      for item in self
        value = yield item
        arr << value
      end
    else
      to_enum(:my_map)
    end
    arr
  end

  def my_inject
    acc = 0
    for elem in self
      acc = yield acc, elem
    end
    acc
  end
end
