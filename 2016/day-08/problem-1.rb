require 'strscan'

def parse_inputFile
  file_location = File.expand_path(File.dirname(__FILE__))
  output = []
  File.open (File.join(file_location, "input")),"r" do |file|
    file.each do |line|
      scanner = StringScanner.new line.chomp
      scanner.scan /(rect |rotate column x=|rotate row y=)(\d+) ?[a-z]+ ?(\d+)/
      command = scanner[1]
      a = scanner[2]
      b = scanner[3]
      output << [command, [a,b]]
    end
  end
  output
end

def init_screen x,y
  output = []
  y.times do
    x_output = []
    x.times do
      x_output << false
    end
    output << x_output
  end

  output
end

def display_output array
  array.each do |row|
    row.each do |pixel|
      print pixel ? "*" : "."
    end
    puts
  end
end

def draw_rect array, x, y
end

def move_y array, row , ammount
end

def move_x array, row , ammount
end

screen = init_screen(50,6)
display_output screen
parse_inputFile
