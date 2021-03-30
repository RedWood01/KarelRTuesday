
$graphical = true

require_relative "../karel/ur_robot"
require_relative "../karel/robota"
require_relative "../mixins/sensor_pack"

class Safe < UrRobot
	include SensorPack
	def move
		if front_is_clear?
			super
		end
	end
	def pick_beeper
		if next_to_a_beeper?
			super
		end
	end
	def put_beeper
		if any_beepers_in_beeper_bag?
			super
		end
	end
end

def task()
	world = Robota::World
	world.read_world("../worlds/mumble.txt")

	karel = Safe.new(1, 2, Robota::NORTH, 0)
		10.times do
			karel.move
			karel.pick_beeper
			karel.move
			karel.put_beeper
		end
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