
$graphical = true

require_relative "../karel/ur_robot"
require_relative "../karel/robota"
require_relative "../mixins/turner"

class Baseball < UrRobot
	include Turner
	def side(longueur)
		longueur.times do 
			put_beeper
			move
			turn_right
			move
			turn_left
		end
	end
	def corner
		turn_left
		move
		move
		put_beeper
		turn_around
		move
		move
		turn_around
	end
end

def task()
	world = Robota::world
	world.read_world("../wolrds/monde")

	karel = Baseball.new(1, 15, Robota::NORTH, INFINITY)
	4.times do
		karel.side(12)
		karel.corner
	end
end

if __FILE__ == $0
	if $graphical
		screen = window(30, 40)
		screen.run do
			task
		end
	else
		task
	end
end