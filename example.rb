require './matrices.rb'

a = Matrix.new [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
b = Matrix.new [[1, 2, 3], [4, 5, 6]]
c = Matrix.new [[7, 8], [9, 10], [11, 12]]
d = Matrix.new [[1, -2, 3], [-4, 5, 6], [7, 8, -9]]
e = Matrix.new [[3, 0, 2], [2, 0, -2], [0, 1, 1]]

u = Vector.new [8, -7]
v = Vector.new [5, -2, 18]
w = Vector.new [8, 13, -7]
x = Vector.new [0, 0.2, 0.8, 0]
y = Vector.new [0.4, 0.3, 0, 0]
z = Vector.new [0, 1, 0]

puts y.unit.inspect