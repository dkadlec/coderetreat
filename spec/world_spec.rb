require 'world'
require 'cell'

describe World do
  let(:world) { World.new }

  describe '#add_cell' do
    it 'add cell to the world' do
      expect(world.size).to eq 0
      world << Cell.new(1,1)
      expect(world.size).to eq 1
    end
  end

  describe '#tick' do
    it 'makes living cell with less then 2 neighbours die' do
      world << Cell.new(1,1)
      world.tick
      expect(world.size).to eq 0
    end

    it 'makes living cell with 2 neighbours live' do
      cell = Cell.new(1,1)
      world << cell
      world << Cell.new(1,2)
      world << Cell.new(2,2)
      world.tick
      expect(world.cells).to include(cell)
    end

    it 'makes living cell with 3 neighbours live' do
      cell = Cell.new(1,1)
      world << cell
      world << Cell.new(0,2)
      world << Cell.new(1,2)
      world << Cell.new(2,2)
      world.tick
      expect(world.cells).to include(cell)
    end

    it 'makes living cell with 4 neighbours die' do
      cell = Cell.new(1,1)
      world << cell
      world << Cell.new(0,1)
      world << Cell.new(0,2)
      world << Cell.new(1,2)
      world << Cell.new(2,2)
      world.tick
      expect(world.cells).not_to include(cell)
    end

    it 'makes dead cell with 3 living neighbours live' do
      world << Cell.new(0,0)
      world << Cell.new(0,1)
      world << Cell.new(1,0)
      world.tick
      expect(world.cells.any? { |c| c.x == 1 && c.y == 1 }).to eq true
    end
  end

  describe '#neighbours' do
    it 'it returns the neighbours for given coordinates' do
      world << Cell.new(1,1)
      expect(world.neighbours(1,1).count).to eq 0
      world << Cell.new(1,2)
      expect(world.neighbours(1,1).count).to eq 1
    end
  end
end
