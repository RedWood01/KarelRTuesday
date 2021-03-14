
require_relative "../karel/ur_robot"
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

	def task
		karel = ToursDePiste.new(1, 1, North, 1)
		karel.tour
		karel2 = ToursDePiste.new(6, 1, East, 0)
		karel2.pick_beeper_et_tour
		karel3 = ToursDePiste.new(6, 6, South, 0)
		karel3.pick_beeper_et_tour
		karel4 = ToursDePiste.new(1, 6, West, 0)		
		karel4.pick_beeper_et_tour
	end
end