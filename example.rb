require './matrices.rb'

a = Matrix.new [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
b = Matrix.new [[1, 2, 3], [4, 5, 6]]
c = Matrix.new [[7, 8], [9, 10], [11, 12]]
d = Matrix.new [[1, -2, 3], [-4, 5, 6], [7, 8, -9]]
e = Matrix.new [[3, 0, 2], [2, 0, -2], [0, 1, 1]]

v_a = Vector.new [0, 0.2, 0.8, 0]
v_b = Vector.new [0.4, 0.3, 0, 0]

puts v_a.is_stochastic?
# => true

puts v_b.is_stochastic?
# => false