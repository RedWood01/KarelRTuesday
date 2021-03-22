
$graphical = true
require_relative "../karel/robota"
require_relative "../karel/ur_robot"

class Recursion11 < UrRobot
	def move_until
		while front_is_clear?
			move
		end
	end
	
	def move_until
		if front_is_clear?
			move
			move_until
		end
	end

	def put_beeper(n)
		unless (any_beepers_in_beeper_bag?==0)
			super
			put_beeper(n)
		end
	end

	def spirale

	end
end

def task()
	world = Robota::World
	world.read_world("../worlds/aleatoire.kwld")

	karel = T8Q3.new(2, 2, Robota::North, 0)
	karel.clear_world
end

if __FILE__ == $0
	if $graphical
		screen = window(12, 40)
		screen.run do
		task
	end
	else
		task
	end
end