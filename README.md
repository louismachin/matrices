# matrices

## Usage

```ruby
    require 'matrices.rb'
```

```ruby
    a = Matrix.new [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    b = Matrix.new [[1, 2, 3], [4, 5, 6]]
    c = Matrix.new [[7, 8], [9, 10], [11, 12]]
    d = Matrix.new [[1, -2, 3], [-4, 5, 6], [7, 8, -9]]
    e = Matrix.new [[3, 0, 2], [2, 0, -2], [0, 1, 1]]
```

```ruby
    u = Vector.new [8, -7]
    v = Vector.new [5, -2, 18]
    w = Vector.new [8, 13, -7]
    x = Vector.new [0, 0.2, 0.8, 0]
    y = Vector.new [0.4, 0.3, 0, 0]
    z = Vector.new [0, 1, 0]
```

```ruby
    a.add(c.multiply(b))
    # => [[40, 56, 72], [53, 73, 93], [66, 90, 114]]
```

```ruby
    c.multiply(b).subtract(a)
    # => [[38, 52, 66], [45, 63, 81], [52, 74, 96]]
```

```ruby
    b.multiply(c)
    # => [[58, 64], [139, 154]]
```

```ruby
    b.scale(3.5)
    # => [[3.5, 7.0, 10.5], [14.0, 17.5, 21.0]]
```

```ruby
    d.determinant()
    # => -306.0
```

```ruby
    a.submatrix(1, 0)
    # => [[2, 3], [8, 9]]
```

```ruby
    a.minor(1, 0)
    # => -6.0
```

```ruby
    a.adjoint()
    # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
```

```ruby
    c.transpose()
    # => [[7, 9, 11], [8, 10, 12]]
```

```ruby
    e.minors()
    # => [[2.0, 2.0, 2.0], [-2.0, 3.0, 3.0], [0.0, -10.0, 0.0]]
```

```ruby
    e.cofactors()
    # => [[2.0, -2.0, 2.0], [2.0, 3.0, -3.0], [0.0, 10.0, 0.0]]
```

```ruby
    e.inverse()
    # => [[0.2, 0.2, 0.0], [-0.2, 0.3, 1.0], [0.2, -0.3, 0.0]]
```

```ruby
    a.swap_rows(1, 2)
    # => [[1, 2, 3], [7, 8, 9], [4, 5, 6]]

```

```ruby
    a.trace()
    # => 15
```

```ruby
    d.leading_diagonal()
    # => -45
```

```ruby
    a.is_square?
    # => true
```

```ruby
    empty_matrix(4, 3)
    # => [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
```

```ruby
    unit_matrix(3)
    # => [[1, 0, 0], [0, 1, 0], [0, 0, 1]]
```

```ruby
    empty_vector(3)
    # => [0, 0, 0]
```

```ruby
    x.is_vector?
    # => true
```

```ruby
    x.is_stochastic?
    # => true

    y.is_stochastic?
    # => false
```

```ruby
    a.multiply(z)
    # => [[2, 5, 8]]
```

```ruby
    u.magnitude.round(2)
    # => 10.63
```

```ruby
    u.direction.round(2)
    # => -0.72
```

```ruby
    v.dimension()
    # => 3
```

```ruby
    v.dot(w)
    # => -112
```

```ruby
    v.similarity(w).round(3)
    # => -0.355
```

```ruby
    v.cross(w)
    # => [-220, -179, 30]
```

```ruby
    u.parallel?(Vector.new [4,-3.5])
    # => true
```

```ruby
    y.unit()
    # => [0.8, 0.6, 0, 0]
```