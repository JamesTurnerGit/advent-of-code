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

class Me
  def initialize
    @distances = {north: 0,west: 0,south: 0,east: 0}
    @visited_locations = []
  end
  def get_x
    @distances[:north] - @distances[:south]
  end
  def get_y
    @distances[:west]  - @distances[:east]
  end
  def distance_from_origin
    dist_x = get_x.abs
    dist_y = get_y.abs
    dist_x + dist_y
  end
  def move facing, distance
    for i in (0...distance)
      @distances[facing] += 1
      location = [get_x,get_y]
      return true if @visited_locations.include?(location)
      @visited_locations << location
    end
    false
  end
end

raw_input = " L5, R1, R4, L5, L4, R3, R1, L1, R4, R5, L1, L3, R4, L2, L4, R2, L4, L1, R3, R1, R1, L1, R1, L5, R5, R2, L5, R2, R1, L2, L4, L4, R191, R2, R5, R1, L1, L2, R5, L2, L3, R4, L1, L1, R1, R50, L1, R1, R76, R5, R4, R2, L5, L3, L5, R2, R1, L1, R2, L3, R4, R2, L1, L1, R4, L1, L1, R185, R1, L5, L4, L5, L3, R2, R3, R1, L5, R1, L3, L2, L2, R5, L1, L1, L3, R1, R4, L2, L1, L1, L3, L4, R5, L2, R3, R5, R1, L4, R5, L3, R3, R3, R1, R1, R5, R2, L2, R5, L5, L4, R4, R3, R5, R1, L3, R1, L2, L2, R3, R4, L1, R4, L1, R4, R3, L1, L4, L1, L5, L2, R2, L1, R1, L5, L3, R4, L1, R5, L5, L5, L1, L3, R1, R5, L2, L4, L5, L1, L1, L2, R5, R5, L4, R3, L2, L1, L3, L4, L5, L5, L2, R4, R3, L5, R4, R2, R1, L5"
input_array = raw_input.split(",")

c = Compass.new
me = Me.new

input_array.each do |input|
  direction = input[1]
  distance = input[2..-1].to_i
  facing = c.turn direction
  break if me.move(facing, distance) == true
end

puts me.distance_from_origin
