require 'rspec'
require 'board'
require 'space'
require 'pry'

describe 'Board' do
  before do
    Board.clear
  end
  describe 'initialize' do
    it 'sets up a lifeworld' do
      test_board = Board.new
      test_board.should be_an_instance_of Board
    end

    it 'sets up a bunch of space objects' do
      test_board = Board.new
      Board.all.count.should eq 400
      Board.all[34].x.should eq 2
      Board.all[24].status.should eq 0
    end
  end

  describe 'generation' do
    it 'needs some yellow stuff' do
      test_board = Board.new
      Board.all[0].give_life
      Board.all[1].give_life
      Board.all[2].give_life
      test_board.generation
      Board.all[0].status.should eq 0
      Board.all[1].status.should eq 1
      Board.all[2].status.should eq 0
      Board.all[21].status.should eq 1
    end
  end
end

describe 'Space' do
  describe 'check_neighbors' do
    it 'returns the number of living negihbors' do
      test_board = Board.new
      Board.all[2].give_life
      Board.all[4].give_life
      Board.all[3].check_neighbors should eq 2
    end
  end
end




