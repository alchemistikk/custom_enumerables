# frozen_string_literal: false

require_relative 'custom_enumerables'

arr = [3, 5, 11, 13, 19]
hash = { name: 'Steve', location: 'New York', occupation: 'Developer' }

arr.my_each { |value| puts value }
arr.each { |value| puts value }
hash.my_each { |key, value| puts "#{key}: #{value}" }
hash.each { |key, value| puts "#{key}: #{value}" }

arr.my_each_with_index { |value, index| puts "#{index}: #{value}" }
arr.each_with_index { |value, index| puts "#{index}: #{value}" }
hash.my_each_with_index { |(key, value), index| puts "#{index}: #{key}: #{value}" }
hash.each_with_index { |(key, value), index| puts "#{index}: #{key}: #{value}" }

p(arr.my_select { |item| item % 2 == 1 })
p(arr.select { |item| item % 2 == 1 })

p(hash.my_select { |_key, value| value == 'New York' })
p(hash.select { |_key, value| value == 'New York' })

p(arr.my_all? { |item| item % 2 == 1 })
p(arr.all? { |item| item % 2 == 1 })

p(hash.my_all? { |_key, value| value == 'New York' })
p(hash.all? { |_key, value| value == 'New York' })
