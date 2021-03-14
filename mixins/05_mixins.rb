
module Mixins05

  def turn_right
    turn_left
    turn_left
    turn_left
  end

  def turn_around
    turn_left
    turn_left
  end

  def move_et_put_beeper
    move
    put_beeper
  end

  def put_column_of_5_beepers
    move_et_put_beeper
    move_et_put_beeper
    move_et_put_beeper
    move_et_put_beeper
    move_et_put_beeper
  end

end