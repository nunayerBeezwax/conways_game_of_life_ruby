require './lib/board'
require './lib/space'
require 'pry'



def main_menu
	puts "\nWelcome to the Command Line display of Conway's 
	Game of Life!" 
	puts "======================\n"
	puts "Press 'P' to play, or 'X' to exit: "
	choice = gets.chomp.upcase
	case choice
	when 'P'
		@lifeworld = Board.new
		activation_menu
	when 'X'
		puts "Thanks for playing, now back to the 'real' world!  ;)"
		exit
	end
end

def activation_menu
	puts "Enter as many X, Y coordinate pairs as you would like to bring to life: "
	puts "When finished, enter 'L' to see an animation of the Lifeworld you have created."
	while true do
		puts "X coord: "
		x = gets.chomp.upcase
		if x == 'L'
			animation
		else
			x = x.to_i
			puts "Y coord: "
			y = gets.chomp.to_i
			user_activated_space = Board.all.find_index { |space| space.x == x && space.y == y }
			Board.all[user_activated_space].give_life
		end
	end
end

def animation

	40.times do	
		world = []
		Board.all.each do |space|
			if space.status == 1
				world << "*"
			else 
				world << "0"
			end
		end
		
		i = 0
		j = 29
		while j + 1 < 600
			puts world[i..j].join
		i += 30
		j += 30
		end
		puts "========================"
		@lifeworld.generation
	end
	Board.clear
	main_menu
end

main_menu
