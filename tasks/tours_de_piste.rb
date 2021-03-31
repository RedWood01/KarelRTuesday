
$graphical = true

require_relative "../karel/ur_robot"
require_relative "../karel/robota"
require_relative "../mixins/05_mixins"

class ToursDePiste < UrRobot
	include Mixins05
	def tour
		move
		move
		move
		move
		move
		turn_right
		put_beeper
	end

	def pick_beeper_et_tour
		pick_beeper
		tour
	end
end

def task()
	world = Robota::World

	karel = ToursDePiste.new(1, 1, NORTH, 1)
	karel.tour
	karel2 = ToursDePiste.new(6, 1, EAST, 0)
	karel2.pick_beeper_et_tour
	karel3 = ToursDePiste.new(6, 6, SOUTH, 0)
	karel3.pick_beeper_et_tour
	karel4 = ToursDePiste.new(1, 6, WEST, 0)		
	karel4.pick_beeper_et_tour
end

if __FILE__ == $0
	if $graphical
		screen = window(10, 40)
		screen.run do
			task
		end
	else
		task
	end
end