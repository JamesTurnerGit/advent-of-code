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

def single_abba? string
  return true if string[0] == string[3] && string [1] == string[2] && !(string[0]==string[1])
  false
end

def abba? string
  string = string.chars
  while true
    return false if string.length == 3
    return true if single_abba? string[0..3]
    string.delete_at 0
  end
end

lines = parse_inputFile

successes = 0


bracketed = lines[61][0]
non_bracketed = lines[61][1]


lines.each do |bracketed,non_bracketed|
  success = true
  bracketed.each do |string|
    if abba? string
      success = false
      break
    end
  end
  if success
    success = false
    non_bracketed.each do |string|
      if abba? string
        success = true
        break
      end
    end
  end
  successes += 1 if success == true
end

p successes
