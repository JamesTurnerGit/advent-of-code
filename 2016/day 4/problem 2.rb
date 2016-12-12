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

def decrypt_char char,num
  return " " if char == "-"
  char_value = char.ord - 97 + num
  char_value = char_value % 26 ##correct the times we went over
  (char_value + 97).chr
end

def decrypt_string string, num
  string = string.chars.map do |char|
    char = decrypt_char char,num
  end
  string.join
end

strings = parse_inputFile

valid_strings = []
strings.each do |string,checksum,id|
  valid_strings <<
   [string,id] if check(string,checksum)
end

valid_strings.each do |string,id|
  decrypted_string = decrypt_string string,id
  if decrypted_string == "northpole object storage"
    puts id
  end
end
