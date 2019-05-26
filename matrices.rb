class Matrix
	def initialize(cells)
		@cells = cells
	end

	def cells() return @cells end

	def columns() return @cells[0].length end

	def rows() return @cells.length end

	def is_square?() return self.columns == self.rows end

	def trace
		sum = 0
		(0...self.rows).each { |k| sum += @cells[k][k]} if self.is_square?
		return self.is_square? ? sum : nil
	end

	def leading_diagonal
		product = 1
		(0...self.rows).each { |k| product *= @cells[k][k]} if self.is_square?
		return self.is_square? ? product : nil
	end

	def minor(matrix = self, c, r)
		return matrix.submatrix(c, r).determinant
	end

	def submatrix(matrix = self, c, r)
		cells = []
		(0...matrix.columns).each { |column|
			m_row = []
			(0...matrix.rows).each {|row| m_row << matrix.cells[column][row] unless (row == r) || (column == c) }
			cells << m_row if m_row.any?
		}
		return Matrix.new(cells)
	end

	def adjoint(matrix = self)
		return nil unless matrix.is_square?
		cells = unit_matrix(matrix.rows).cells
		(0...matrix.columns).each { |c| (0...matrix.rows).each { |r| cells[c][r] = matrix.cells[r][c] } }
		return Matrix.new(cells)
	end

	def transpose(matrix = self)
		a = empty_matrix(matrix.rows, matrix.columns)
		(0...a.columns).each { |c| (0...a.rows).each { |r| a.cells[r][c] = matrix.cells[c][r] } }
		return a
	end
	
	def minors(matrix = self)
		a = empty_matrix(matrix.columns, matrix.rows)
		(0...a.columns).each { |c| (0...a.rows).each { |r| a.cells[c][r] = matrix.minor(c, r) } }
		return a
	end

	def cofactors(matrix = self)
		a = matrix.minors
		(0...a.columns).each { |c| (0...a.rows).each { |r| a.cells[c][r] *= -1 if ((r + c) % 2 == 1) } }
		return a
	end

	def inverse(matrix = self)
		return matrix.cofactors.transpose.scale(1 / matrix.determinant)
	end

	def swap_rows(matrix = self, a, b)
		matrix.cells[a], matrix.cells[b] = matrix.cells[b], matrix.cells[a]
		return matrix
	end

	def determinant(matrix = self)
		return nil unless matrix.is_square?
		def cancel_rows(cells, a, b, c)
			mult = cells[b][c] / cells[a][c].to_f
			(0...cells[0].length).each { |i| cells[b][i] = cells[b][i] - cells[a][i] * mult }
			return cells
		end
		sign, i, j, a = 1, 0, 0, matrix.cells
		until (i == a[0].length - 1) || (j == a.length - 1)
			if a[i][j] == 0
				k, is_swapped = 0, false
				until is_swapped || (k == a[0].length)
					unless a[k][j] == 0
						a = swap_rows(Matrix.new(a), i, k).cells
						is_swapped, sign = true, sign * -1
					end
					k += 1
				end
				j += 1 unless is_swapped
			end
			(0...a.length).each { |k| a = cancel_rows(a, i, k, j) unless (i == k)}
			i, j = i + 1, j + 1
		end
		return Matrix.new(a).leading_diagonal * sign
	end

	def add(a = self, b)
		return nil unless (a.columns == b.columns) && (a.rows == b.rows)
		(0...a.columns).each { |m| (0...a.rows).each { |n| a.cells[n][m] += b.cells[n][m] } }
		return a
	end

	def subtract(a = self, b)
		return nil unless (a.columns == b.columns) && (a.rows == b.rows)
		(0...a.columns).each { |m| (0...a.rows).each { |n| a.cells[n][m] -= b.cells[n][m] } }
		return a
	end

	def multiply(a = self, b)
		return nil unless (a.columns == b.rows) && (a.rows == b.columns)
		c = empty_matrix(a.rows)
		(0...c.rows).each { |i| (0...c.rows).each { |j| (0...b.rows).each { |k| c.cells[j][i] += a.cells[j][k] * b.cells[k][i] } } }
		return c
	end

	def scale(matrix = self, s)
		(0...matrix.columns).each { |i| (0...matrix.rows).each { |j| matrix.cells[j][i] *= s } }
		return matrix
	end
end

class Vector < Matrix
	def initialize(cells)
		@cells = Matrix.new([cells]).transpose.cells
	end

	def row()
		return self.transpose.cells.first
	end

	def is_stochastic?() return self.row.sum == 1 end
end

def empty_matrix(columns, rows)
	return Matrix.new(Array.new(rows) { Array.new(columns) { 0 } } )
end

def unit_matrix(order)
	cells = Array.new(order) { Array.new(order) }
	(0...order).each { |i| (0...order).each { |j| cells[i][j] = (i == j) ? 1 : 0 } }
	return Matrix.new(cells)
end