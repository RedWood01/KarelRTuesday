#Change this so it has stategies
$graphical = true
require_relative "../karel/ur_robot"

class Beeper1 < UrRobot
	def mettre_rangee(combien)
		combien.times do
			put_beeper
			move
		end
	end
end

class Beeper2 < UrRobot
	def mettre_rangee(combien)
		combien.times do
			put_beeper
			put_beeper
			move
		end
	end

end

class Beeper3 < UrRobot
	def mettre_rangee(combien)
		combien.times do
			put_beeper
			put_beeper
			put_beeper
			move
		end
	end
end

def task()
	world = Robota::World
	world.read_world("../worlds/monde")

	beeper1 = Beeper1.new(1, 1, East, Infinity)
	beeper1.mettre_rangee()
	beeper2 = Beeper2.new(2, 1, East, Infinity)
	beeper2.mettre_rangee()
	beeper3 = Beeper3.new(3, 1, East, Infinity)
	beeper3.mettre_rangee()
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
