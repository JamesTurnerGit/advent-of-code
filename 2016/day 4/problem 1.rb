def parse_inputFile
  Dir.chdir("2016/day 4")
  output = []
  File.open "input","r" do |file|
    file.each do |line|
      checksum = line[-7..-3]
      string = line[0..-13]
      id = line[-11..-9].to_i
      output << [string,checksum,id]
    end
  end
  output
end

def generate_checksum string
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
  ## join whole thing into final string
  output = output.join
  ##first 5 letters will be checksum
   output [0..4]
end

def check string,checksum
  generate_checksum(string) == checksum
end

p generate_checksum("a-b-c-d-e-f-g-h")
strings = parse_inputFile
total = 0

strings.each do |string,checksum,id|
  total += id if check(string,checksum)
end

p total
