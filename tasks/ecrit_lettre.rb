
require_relative "../karel/ur_robot"
require_relative "../mixins/06_mixins"


class EcrivianDeH < UrRobot
	include Mixins06
	def ecrit_lettre
		put_coloumn_of_5_beepers
		turn_around
		move2_et_turn_left
		move
		put_beeper_et_move
		put_beeper_et_move
		turn_left
		move
		move
		turn_around
		put_coloumn_of_5_beepers
	end
end

class EcrivianDeE < UrRobot
	include Mixins06
	def ecrit_lettre
		put_coloumn_of_5_beepers
		turn_right
		move
		put_beeper_et_move
		put_beeper
		turn_around
		move2_et_turn_left
		move2_et_turn_left
		move
		put_beeper_et_move
		put_beeper
		turn_around
		move2_et_turn_left
		move2_et_turn_left
		move
		put_beeper_et_move
		put_beeper
	end
end

class EcrivianDeL < UrRobot
	include Mixins06
	def ecrit_lettre
		put_coloumn_of_5_beepers
		turn_around
		move
		move
		move2_et_turn_left
		move
		put_beeper_et_move
		put_beeper
	end
end

class EcrivianDeO < UrRobot
	include Mixins06
	def ecrit_lettre
		put_coloumn_of_5_beepers
		turn_right
		move
		put_beeper_et_move
		put_beeper
		turn_right
		move
		put_coloumn_of_5_beepers
		turn_right
		move
		put_beeper_et_move
		put_beeper
	end
end

class Hello < UrRobot
	include Mixins06
	def task
		karel = EcrivianDeH.new(3,2,North,Infinity)
		karel.ecrit_lettre
		karel2 = EcrivianDeE.new(3,7,North,Infinity)
		karel2.ecrit_lettre
		karel3 = EcrivianDeL.new(3,11,North,Infinity)
		karel3.ecrit_lettre
		karel3 = EcrivianDeL.new(3,15,North,Infinity)
		karel3.ecrit_lettre
		karel4 = EcrivianDeO.new(3,19,North,Infinity)
		karel4.ecrit_lettre
	end
end

