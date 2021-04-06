
$graphical = true

require_relative "../karel/ur_robot"
require_relative "../karel/robota"
require_relative "../mixins/turner"
require_relative "../mixins/sensor_pack"

class Mur < UrRobot
	include Turner
	include SensorPack
	def remplace_coin
		if next_to_a_beeper?
			while next_to_a_beeper?
				pick_beeper
			end
		end
		5.times do
			put_beeper
		end
 	end

 	def remplace_un_long_cote
 		8.times do
 			remplace_coin
 			move
 		end
 		turn_right
 	end

 	def remplace_un_petit_cote
 		6.times do
 			remplace_coin
 			move
 		end
 		turn_right
 	end

 	def reparer_mur
 		remplace_un_long_cote
 		remplace_un_petit_cote
 		remplace_un_long_cote
 		remplace_un_petit_cote
 	end

end

def task()
	world = Robota::World
	world.read_world("../worlds/mur.kwld")

	karel = Mur.new(2, 3, Robota::NORTH, INFINITY)
	karel.reparer_mur
end

if __FILE__ == $0
	if $graphical
		screen = window(12, 100)
		screen.run do
			task
		end
	else
		task
	end
end
