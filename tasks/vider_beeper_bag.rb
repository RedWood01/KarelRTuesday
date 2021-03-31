$graphical = true

require_relative "../karel/ur_robot"
require_relative "../karel/robota"
require_relative "../mixins/sensor_pack"

class ViderBeeperBag < UrRobot
	include SensorPack
	def put_beeper
		while any_beepers_in_beeper_bag?
			super
		end
	end
end

class ViderBeeperBag2 < UrRobot
	include SensorPack
	def put_beeper
		if any_beepers_in_beeper_bag?
			super
			put_beeper
		end
	end
end

def task()
	world = Robota::World

	karel = ViderBeeperBag.new(2, 2, Robota::NORTH, 7)
		karel.put_beeper
		karel.move
end

if __FILE__ == $0
	if $graphical
		screen = window(8, 40)
		screen.run do
			task
		end
	else
		task
	end
end