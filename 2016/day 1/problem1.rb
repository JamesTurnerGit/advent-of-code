#direction= {north: 0,west: 0,south: 0,east: 0}

class Compass
  def initialize
    @facing = 0
  end
  def turn var
    var == "L" ? @facing += 1: @facing -= 1
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

c = Compass.new
puts c.turn "L"
