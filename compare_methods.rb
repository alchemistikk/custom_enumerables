# frozen_string_literal: false

require_relative 'custom_enumerables'

arr = [1, 2, 3]
hash = { food: 'taco', tv: 'samsung' }

# 1. Compare my_each to each
arr.my_each { |item| puts item }
arr.each { |item| puts item }

hash.my_each { |item| puts item }
hash.each { |item| puts item }
