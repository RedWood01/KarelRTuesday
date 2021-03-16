
$graphical = true
require_relative "../karel/ur_robot"
require_relative "../mixins/sensor_pack"
require_relative "../mixins/turner"

class T8Q4 < UrRobot
	include SensorPack
	include Turner
	def clear_spot_et_put_2_beeper
		if next_to_a_beeper?
			pick_beeper
		end
		put_beeper
		put_beeper
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
				put_beeper
				put_beeper
		end
		if front_is_clear?
			move
		end
	end

	def fill_world
		90.times do
			clear_spot_et_put_2_beeper
		end
	end
end

def task()
	world = Robota::World
	world.read_world("../worlds/aleatoire.kwld")

	karel = T8Q4.new(2, 2, Robota::North, Infinity)
	karel.fill_world
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