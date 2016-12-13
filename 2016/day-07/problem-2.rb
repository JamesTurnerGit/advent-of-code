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

def single_ssl? string
  return true if string[0] == string[2] && !(string[0]==string[1])
  false
end

def ssl? string
  string = string.chars
  output = []
  while true
    return output if string.length == 2
    output << string [0..2].join if single_ssl? string[0..2]
    string.delete_at 0
  end
end

lines = parse_inputFile
successes = 0

lines.each do |bracketed,non_bracketed|
  success = false
  aba = []
  bracketed.each {|string|aba << ssl?(string)}
  aba.flatten!
  if aba.length > 0
    aba.each do |sub_aba|
      bab = "#{sub_aba[1]}#{sub_aba[0]}#{sub_aba[1]}"
      non_bracketed.each do |string|
        if string.include? bab
          success = true
          break
        end
      end
    end
  end
  successes += 1 if success
end

p successes
