require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @matrix = Array.new(width) { Array.new(height) }
    @width = width
    @height = height
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x, y)
      matrix[x][y] = pixel
    end
  end

  def at(x, y)
    if inbounds(x,y)
      return matrix[x][y]
    else
      return nil
    end
  end

  private

  def inbounds(x, y)
    is_valid = true;
    if (x < 0 || x > width - 1) || (y < 0 || y > height - 1)
      is_valid = false
    end
    return is_valid
  end

end
