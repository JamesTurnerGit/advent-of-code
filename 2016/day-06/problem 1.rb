def parse_inputFile
  output = [[],[],[],[],[],[],[],[]]
  File.open "input","r" do |file|
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
    count = string.count(letter)
    if count > 0
      output[count] ||= ""
      output[count] += letter
    end
  end
  ## sort by ammount
  output = output.sort_by{|key,value| key}.reverse
  ## sort ties and discard keys
  output.map! {|key,value| value.chars.sort.join}
  output[0]
end

input = parse_inputFile
input.each
