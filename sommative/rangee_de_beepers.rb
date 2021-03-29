
$graphical = true

require_relative "../karel/ur_robot"
require_relative "../karel/robota"
require_relative "../mixins/turner"

class DeplacerRangee < UrRobot
	include Turner
	def pick_rangee
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

class DupliquerRangee < UrRobot
	include Turner
	beepers = []
	n = 0
	m = 1
	def pick_rangee
		if next_to_a_beeper?
			while next_to_a_beeper?
				pick_beeper
				n = n+1
			end
			beepers[] = n
		end
	else
		beepers << 0
		move
	end
	n = 0
end

def task()
	world = Robota::world
	world.read_world("../wolrds/rangee.kwld")
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