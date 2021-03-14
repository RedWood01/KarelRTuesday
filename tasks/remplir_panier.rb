
require_relative "../karel/ur_robot"
require_relative "../mixins/05_mixins"

class RemplirPanier < UrRobot
	include Mixins05
	def pick_10_beeper
		pick_beeper
		pick_beeper
		pick_beeper
		pick_beeper
		pick_beeper
		pick_beeper
		pick_beeper
		pick_beeper
		pick_beeper
		pick_beeper
	end
	def put_10_beeper
		put_beeper
		put_beeper
		put_beeper
		put_beeper
		put_beeper
		put_beeper
		put_beeper
		put_beeper
		put_beeper
		put_beeper
	end
	def remplir_panier
		turn_around
		move
		move
		move
		turn_right
		move
		move
		move
		move
		move
		pick_10_beeper
		move
		pick_10_beeper
		turn_right
		move
		pick_10_beeper
		turn_around
		move
		turn_left
		move
		move
		move
		move
		move
		move
		turn_left
		move
		move
		move
		move
		turn_left
		move
		move
		turn_left
		move
		move
		move
		turn_left
		move
		pick_10_beeper
		turn_left
		move
		turn_left
		move
		move
		move
		move
		move
		move
		move
		move
		turn_right
		move
		move
		move
		move
		move
		move
		turn_right
		move
		put_10_beeper
		put_10_beeper
		put_10_beeper
		put_10_beeper
	end
end