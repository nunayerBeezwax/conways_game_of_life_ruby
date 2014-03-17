class Space

  attr_reader :x, :y, :status, :living_neighbors

  def initialize(x, y)
    @x = x
    @y = y
    @status = 0
  end

  def give_life
    @status = 1
  end

  def take_life
    @status = 0
  end

  def check_neighbors
    @living_neighbors = []
    for space in Board.all
      if space.status == 1 && space != self
        if (self.x - space.x).abs <= 1 && (self.y - space.y).abs <= 1
          @living_neighbors << space
        end
      end
    end
    @living_neighbors.length
  end
end
