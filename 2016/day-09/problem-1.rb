require 'strscan'

def parse_inputFile #for this one break into array of args + strings
  file_location = File.expand_path(File.dirname(__FILE__))
  line = File.read(File.join(file_location, "input"))
  output = []
  string = []
  while !line.empty?
    char = line[0]
    line = line[1..-1]
    if char != "("
      string << char
    else
      output << [string.join,0]
      args = line.match(/(\d+)x(\d+)\)/)
      length  = args[1].to_i
      ammount = args[2].to_i
      line = line[args[0].length..-1]
      string = line[0..length-1]
      line = line[string.length..-1]
      output << [string,ammount]
      string = []
    end
    output
  end
  args = 0
  output
end

def unpack_this array
  output = []
  array.each do |string,ammount|
    output << (string * ammount)
  end
  output.join
end

thing = parse_inputFile
p (unpack_this thing).length
