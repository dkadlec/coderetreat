class Cell
  attr_reader :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def neighbour_positions
    (@x - 1.. @x + 1).each_with_object([]) do |x, positions|
      (@y - 1.. @y + 1).each do |y|
        if @x != x && @y != y
          positions << [x, y]
        end
      end
    end
  end
end
