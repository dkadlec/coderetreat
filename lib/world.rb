class World
  attr_reader :cells

  def initialize
    @cells = []
  end

  def <<(cell)
    @cells << cell
  end

  def size
    @cells.count
  end

  def tick
    dup = @cells.dup

    @cells.each do |cell|
      dup.delete(cell) if should_die? cell
    end

    @cells = dup
  end

  def should_die?(cell)
    neighbours_count = neighbours(cell.x, cell.y).count
    neighbours_count < 2 || neighbours_count > 3
  end

  def neighbours(x, y)
    @cells.select do |cell|
      (0..1).to_a.include?((cell.x - x).abs) &&
      (0..1).to_a.include?((cell.y - y).abs)
    end.reject do |cell|
      cell.x == x && cell.y == y
    end
  end
end
