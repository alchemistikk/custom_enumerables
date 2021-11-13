# frozen_string_literal: false

# For each method, create a script to compare your method to
# Ruby’s enumerable method, such as:

# puts "my_each vs. each"
# numbers = [1, 2, 3, 4, 5]
# numbers.my_each  { |item| puts item }
# numbers.each  { |item| puts item }

# Create #my_each, a method that is identical to #each but (obviously)
# does not use #each. You’ll need to use a yield statement.
# Make sure it returns the same thing as #each as well.

# Add methods to Enumerable module
module Enumerable
  def my_each
    for k, v in self do
      yield k, v
    end
  end
end
