
require_relative "../karel/ur_robot"
require_relative "../mixins/05_mixins"

class BeeperRows < UrRobot
	include Mixins05

	def beeper_row
		karel = BeeperRows.new(4,3,North,Infinity)
		turn_right
		move
		move
		move
		turn_left
		move
		move
		turn_left
		put_column_of_5_beepers
	end

	def beeper_column
		karel = BeeperRows.new(2,5,East,Infinity)
		turn_right
		move
		move
		move
		turn_left
		move
		move
		turn_left
		put_column_of_5_beepers
	end
end