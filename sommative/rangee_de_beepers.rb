
$graphical = true

require_relative "../karel/ur_robot"
require_relative "../karel/robota"
require_relative "../mixins/turner"
require_relative "../mixins/sensor_pack"



class DeplacerRangee1 < UrRobot
	include Turner
	def pick_rangee
		move
		pick_beeper
		pick_beeper
		pick_beeper
		move
		pick_beeper
		move
		move
		move
		pick_beeper
		pick_beeper
		move
		move
		pick_beeper
		move
		pick_beeper
		move
		pick_beeper
	end
	def put_rangee
		put_beeper
		move
		put_beeper
		move
		put_beeper
		move
		move
		put_beeper
		put_beeper
		move
		move
		move
		put_beeper
		move
		put_beeper
		put_beeper
		put_beeper
		move
	end
	def rangee
		pick_rangee
		turn_right
		move
		move
		turn_right
		put_rangee
	end
end

class DeplacerRangee < UrRobot
@arr = [0]
	include Turner
	include SensorPack
	def pick_rangee
		n = 0
		m = 1
		9.times do 
			if next_to_a_beeper?
				while next_to_a_beeper?
					pick_beeper
					n = n+1
				end
			end
			@arr[m] = n
			move
			n = 0
			m = m+1
		end
	end
	def put_rangee
		n = 0
		m = 9
		9.times do
			unless @arr[m] == 0
				if @arr[m] == 3
					put_beeper
					put_beeper
				end
				if @arr[m] == 2
					put_beeper
				end
				put_beeper
			end
			move
			m = m-1
		end
	end
	def rangee
		move
		pick_rangee
		turn_right
		move
		move
		turn_right
		put_rangee
		move
	end
end

class DupliquerRangee < UrRobot
	include Turner
	include SensorPack
	def pick_rangee
		9.times do 
			if next_to_a_beeper?
				while next_to_a_beeper?
					pick_beeper
					n = n+1
				end
			end
			arr[m] = n
			n.times do 
				put_beeper
			end
			move
			n = 0
			m = m+1
		end
	end
	def put_rangee
		m = 9
		9.times do
			unless arr[m] == 0
				if arr[m] == 3
					put_beeper
					put_beeper
				end
				if arr[m] == 2
					put_beeper
				end
				put_beeper
			end
			move
			m = m-1
		end
	end
	def rangee
		move
		pick_rangee
		turn_right
		move
		move
		turn_right
		put_rangee
		move
	end
end

def task()
	world = Robota::World
	world.read_world("../worlds/rangee.kwld")

	karel = DeplacerRangee.new(1, 3, Robota::NORTH, 0)
	karel.rangee
end

if __FILE__ == $0
	if $graphical
		screen = window(11, 100)
		screen.run do
			task
		end
	else
		task
	end
end