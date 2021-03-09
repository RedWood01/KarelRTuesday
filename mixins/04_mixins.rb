
module Mixins04

  def turn_right
    turn_left
    turn_left
    turn_left
  end

  def turn_around
    turn_left
    turn_left
  end

  def move_diagnol_right
  	turn_right
  	move
  	turn_left
  	move
  end

  def put_beeper_et_move
  	put_beeper
  	move
  end

  def put_beeper_2
  	put_beeper
  	put_beeper
  end

  def put_beeper_3
  	put_beeper_2
  	put_beeper
  end

  def put_beeper_4
  	put_beeper_3
  	put_beeper
  end

  def put_beeper_5
  	put_beeper_4
  	put_beeper
  end
  
  def put_beeper_6
  	put_beeper_5
  	put_beeper
  end

end