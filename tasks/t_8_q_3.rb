
$graphical = true
require_relative "../karel/ur_robot"
require_relative "../mixins/sensor_pack"
require_relative "../mixins/turner"

class T8Q3 < UrRobot
	include SensorPack
	include Turner
	def clear_spot_et_move
		if next_to_a_beeper?
			pick_beeper
		end
		unless front_is_clear?
		 	if facing_north?
		 		turn_right
		 		if front_is_clear?
		 			move
		 			turn_right
		 		end
		 	end
		 	if facing_south?
		 		turn_left
		 		move
		 		turn_left
		 	end
		 	if next_to_a_beeper?
				pick_beeper
			end
		end
		if front_is_clear?
			move
		end
	end

	def clear_world
		90.times do
			clear_spot_et_move
		end
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