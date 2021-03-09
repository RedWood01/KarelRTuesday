
module Mixins06

  def turn_right
    turn_left
    turn_left
    turn_left
  end
  
  def turn_around
    turn_left
    turn_left
  end
  
  def put_beeper_et_move
  	put_beeper
  	move
  end

  def move2_et_turn_left
  	move
  	move
  	turn_left
  end

  def put_coloumn_of_5_beepers
  	put_beeper_et_move
	put_beeper_et_move
	put_beeper_et_move
	put_beeper_et_move
	put_beeper
  end

end