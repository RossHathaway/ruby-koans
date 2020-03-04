# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
# all sides must be > 0
# check if the largest side is less than sum of other two sides
# 
def sides_equal?(side_1, side_2)
  side_1 == side_2
end

def triangle(a, b, c)
  sorted_sides = [a, b, c].sort

  if sorted_sides.first <= 0
    raise TriangleError, "Sides should be greater than 0"

  elsif sorted_sides.last - sorted_sides[0, 2].sum >= 0
    raise TriangleError, "Sum of smallest sides should be greater than largest side"
  end

  result = :scalene

  if (a == b && a == c)
    result = :equilateral
  elsif (a == b || b == c || a == c)
    result = :isosceles
  end

  result
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
