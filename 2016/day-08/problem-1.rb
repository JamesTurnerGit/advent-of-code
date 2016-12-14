require 'strscan'

def parse_inputFile
  file_location = File.expand_path(File.dirname(__FILE__))
  output = []
  File.open (File.join(file_location, "input")),"r" do |file|
    file.each do |line|
      scanner = StringScanner.new line.chomp
      scanner.scan /(rect |rotate column x=|rotate row y=)(\d+) ?[a-z]+ ?(\d+)/
      command = scanner[1]
      a = scanner[2].to_i
      b = scanner[3].to_i
      output << [command, a,b]
    end
  end
  output
end

class Screen
  def initialize x,y
    @display = []
    y.times do
      display_row = []
      x.times {display_row << nil}
      @display << display_row
    end
  end

  def display
    @display.each do |row|
      row.each {|pixel| print pixel ? "#" : " "}
      puts
    end
    puts
  end

  def draw_rect x, y
    @display.map!.each_with_index do |row,pos_y|
      row.map!.each_with_index do |pixel,pos_x|
        if pos_x < x && pos_y < y
          1
        else
          pixel
        end
      end
    end
  end

  def shift_array! array, magnitude
    magnitude.times do
      popped = array.pop
      array.unshift(popped)
    end
  end

  def move_y y, magnitude
    shift_array! @display[y],magnitude
  end

  def move_x x ,magnitude
    temporary_array = []
    for y_pos in (0...@display.length) do
      temporary_array << @display[y_pos][x]
    end
    shift_array! temporary_array, magnitude
    for y_pos in (0...@display.length) do
       @display[y_pos][x] = temporary_array[y_pos]
    end
  end
  def count_pixels
    @display.flatten.compact.reduce(0,:+)
  end
end

screen = Screen.new(50,6)
commands = parse_inputFile

commands.each do |command,a,b|
  case command
  when "rotate column x=" then screen.move_x a,b
  when "rotate row y=" then screen.move_y a,b
  when "rect " then screen.draw_rect a,b
  end
  system "clear" or system "cls"
  screen.display
end

puts screen.count_pixels
