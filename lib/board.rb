class Board

  @@all_spaces = []

  def Board.clear
    @@all_spaces = []
  end

  def Board.all
    @@all_spaces
  end

  def initialize
    x = 1
    20.times do
      y = 1
      30.times do
        @@all_spaces << Space.new(x, y)
        y += 1
      end
      x += 1
    end
  end

  def generation
    death_row = []
    another_day = []
    Board.all.each do |space|
      if space.check_neighbors == 3
        another_day << space
      elsif space.check_neighbors > 3
        death_row << space
      elsif space.check_neighbors < 2
        death_row << space
      end
    end
    death_row.each { |space| space.take_life }
    another_day.each { |space| space.give_life }
  end
end
