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
```

```ruby
    a.add(c.multiply(b))
    # [[40, 56, 72], [53, 73, 93], [66, 90, 114]]
```

```ruby
    c.multiply(b).subtract(a)
    # [[38, 52, 66], [45, 63, 81], [52, 74, 96]]
```

```ruby
    b.multiply(c)
    # [[58, 64], [139, 154]]
```

```ruby
    d.determinant()
    # -306.0
```

```ruby
    a.minor(1, 0)
    # [[2, 3], [8, 9]]
```

```ruby
    a.adjoint()
    # [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
```

```ruby
    a.swap_rows(1, 2)
    # [[1, 2, 3], [7, 8, 9], [4, 5, 6]]

```

```ruby
    a.trace()
    # 15
```

```ruby
    d.leading_diagonal()
    # -45
```

```ruby
    a.is_square?()
    # true
```

```ruby
    zero_matrix(4)
    # [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
```

```ruby
    unit_matrix(3)
    # [[1, 0, 0], [0, 1, 0], [0, 0, 1]]
```