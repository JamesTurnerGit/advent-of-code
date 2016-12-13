##50x6

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

p  parse_inputFile
