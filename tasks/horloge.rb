
require_relative "../karel/ur_robot"
require_relative "../mixins/04_mixins"

#Option 1 (Un beeper a chaque heur)
class Horloge < UrRobot
	include Mixins04
	def put_quarter_of_time
		put_beeper_et_move
		move
		put_beeper_et_move
		turn_right
		move
		move
		put_beeper_et_move
		move
	end

	def task
		karel = Horloge.new(2,2,North,Infinity)
		move
		move
		move
		move
		put_quarter_of_time
		put_quarter_of_time
		put_quarter_of_time
		put_quarter_of_time
		turn_off
	end
end

#Option 2 (Le meme nombre de beeper que l'heur q'il remplace a chaque hour)
#Exemple: met 6 beepers sur le place de 6h

class Horloge2 < UrRobot
	include Mixins04
	def next_hour
		move
		move
	end

	def task
		karel = Horloge2.new(2,2,North,Infinity)
		next_hour
		put_beeper_6
		put_beeper_2
		next_hour
		put_beeper_6
		put_beeper_3
		next_hour
		put_beeper_6
		put_beeper_4
		move
		turn_right
		next_hour
		put_beeper_6
		put_beeper_5
		next_hour
		put_beeper_6
		put_beeper_6
		next_hour
		put_beeper
		move
		turn_right
		next_hour
		put_beeper_2
		next_hour
		put_beeper_3
		next_hour
		put_beeper_4
		move
		turn_right
		next_hour
		put_beeper_5
		next_hour
		put_beeper_6
		next_hour
		put_beeper_6
		put_beeper
		turn_off
	end
end