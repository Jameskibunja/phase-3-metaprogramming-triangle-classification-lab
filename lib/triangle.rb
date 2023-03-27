class Triangle
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    validate_triangle
  end

  def kind
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    sides = [a, b, c]
    raise TriangleError if sides.any? { |side| side <= 0 }
    raise TriangleError unless sides[0] + sides[1] > sides[2] &&
                               sides[0] + sides[2] > sides[1] &&
                               sides[1] + sides[2] > sides[0]
  end

  class TriangleError < StandardError
  end
end
