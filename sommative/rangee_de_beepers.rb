
$graphical = true

require_relative "../karel/ur_robot"
require_relative "../karel/robota"
require_relative "../mixins/turner"
require_relative "../mixins/sensor_pack"

class DeplacerRangee < UrRobot
	include Turner
	include SensorPack
	def initialize (street, avenue, direction, beepers)
    	super(street, avenue, direction, beepers)
    	@arr = []
 	end

	def pick_rangee
		n = 0
		10.times do 
			if next_to_a_beeper?
				while next_to_a_beeper?
					pick_beeper
					n = n+1
				end
			end
			@arr << n
			move
			n = 0
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
		pick_rangee
		turn_right
		move
		move
		turn_right
		move
		put_rangee
	end
end

class DupliquerRangee < UrRobot
	include Turner
	include SensorPack
	def initialize (street, avenue, direction, beepers)
    	super(street, avenue, direction, beepers)
    	@arr = []
 	end
	def pick_rangee
		n = 0
		10.times do 
			if next_to_a_beeper?
				while next_to_a_beeper?
					pick_beeper
					n = n+1
				end
			end
			@arr << n
			n.times do 
				put_beeper
			end
			move
			n = 0
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
		pick_rangee
		turn_right
		move
		move
		turn_right
		move
		put_rangee
	end
end

def task()
	world = Robota::World
	world.read_world("../worlds/rangee.kwld")

	karel = DupliquerRangee.new(1, 3, Robota::NORTH, INFINITY)
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