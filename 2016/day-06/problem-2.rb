def parse_inputFile
  output = [[],[],[],[],[],[],[],[]]
  file_location = File.expand_path(File.dirname(__FILE__))
  File.open (File.join(file_location, "input")),"r" do |file|
    file.each do |line|
      line.chomp.chars.each_with_index do |char,index|
        output[index] << char
      end
    end
  end
  output.map{|line| line.join}
end

def most_common chars
  output = {}
  ##count letters
  for letter in "a".."z" ##count letters
    count = chars.count(letter)
    if count > 0
      output[count] ||= ""
      output[count] += letter
    end
  end
  ## sort by ammount
  output = output.sort_by{|key,value| key}.reverse
  ## sort ties and discard keys
  output.map! {|key,value| value.chars.sort.join}
  output[-1]
end

characters = parse_inputFile
characters.map! do |char|#
 char = most_common char
end

puts characters.join
