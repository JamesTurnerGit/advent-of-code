direction= {north: 0,west: 0,south: 0,east: 0}
input = "L2"

class Compass
  def initilize
    @facing = 0
  end
  def turn var
    var == "L" ? @facing ++ 1: @facing --1
    @facing = 0 if @facing == 4
    @facing = 3 if @facing == -1
    case @facing
    when 0 then return :north
    when 1 then return :west
    when 2 then return :south
    when 3 then return :east
    end
  end
end

##loop over input string
#c = Compass.new
#while input.length >= 0
  #change_in_direction = input.shift
  #new_facing = c.turn change_in_direction
  #puts new_facing
    ## parse direction
#end
