require 'strscan'

def parse_inputFile
  file_location = File.expand_path(File.dirname(__FILE__))
  output = []
  File.open (File.join(file_location, "input")),"r" do |file|
    file.each do |line|
      line_output = [[],[]]
      counter = 0
      scanner = StringScanner.new line.chomp
      while !scanner.eos?
        counter += 1
        if counter.even?
          line_output[0] << scanner.scan(/\w+/)
        else
          line_output[1] << scanner.scan(/\w+/)
        end
        scanner.scan(/[\[\]]/)
      end
      output << line_output
    end
  end
  output
end

def abba?
end

lines = parse_inputFile
p lines[0]
