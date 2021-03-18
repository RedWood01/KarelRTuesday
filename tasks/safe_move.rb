
$graphical = true

require_relative "../karel/ur_robot"
require_relative "../mixins/sensor_pack"

class SafeMove < UrRobot
	include SensorPack
	def move
		if front_is_clear?
			super
		end
	end
end

class SafeMove2 < UrRobot
	include SensorPack
	def move
		unless !front_is_clear?
			super
		end
	end
end