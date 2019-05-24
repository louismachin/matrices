# matrices

## Usage

```ruby
require 'matrices.rb'
```

```ruby
a = Matrix.new(
    [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
    ]
)
b = Matrix.new(
    [
        [1, 2, 3], 
        [4, 5, 6]
    ]
)
c = Matrix.new(
    [
        [7, 8], 
        [9, 10], 
        [11, 12]
    ]
)
```

```ruby
    a.add(c.multiply(b))
```

```ruby
    a.subtract(c.multiply(b))
```

```ruby
    b.multiply(c)
```

```ruby
    a.determinant()
```

```ruby
    a.minor(1, 0)
```

```ruby
    a.adjoint()
```

```ruby
    a.swap_rows(1, 2)
```

```ruby
    a.trace()
```

```ruby
    a.leading_diagonal()
```

```ruby
    a.is_square?()
```

```ruby
    zero_matrix(4)
```

```ruby
    unit_matrix(5)
```