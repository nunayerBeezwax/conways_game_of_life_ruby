require './lib/board'
require './lib/space'


def main_menu
	puts "\nWelcome to the Command Line display of Conway's 
	Game of Life!" 
	puts "======================\n"
	puts "Give us a seed, how about 3 sets of x, y coordinates: "
	first_x = gets.chomp.to_i
	first_y = gets.chomp.to_i
	second_x = gets.chomp.to_i
	second_y = gets.chomp.to_i	
	third_x = gets.chomp.to_i
	third_y = gets.chomp.to_i
	@lifeworld = Board.new
	first_space = @lifeworld.all.find_index {|space| space.x == first_x && space.y == first_y }
	@lifeworld.all[first_space].give_life
	second_space = @lifeworld.all.find_index {|space| space.x == second_x && space.y == second_y }
	@lifeworld.all[second_space].give_life
	third_space = @lifeworld.all.find_index {|space| space.x == third_x && space.y == third_y }
	@lifeworld.all[third_space].give_life
	puts "Thanks, we've activated those 3 spaces, now let's watch what happens!"
	animation
end

def animation
	10.times do
		@lifeworld.all.each do |space|
			if space.status = 1
				puts "#"
			else 
				puts "0"
			end
		end
		@lifeworld.generation
		animation
	end
	main_menu
end

main_menu