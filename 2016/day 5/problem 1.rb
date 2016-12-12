require 'digest/md5'

def parse_inputFile
  output = []
  File.open "input","r" do |file|
    file.each do |line|
      output << line
    end
  end
  output[0].chomp
end

original_string = parse_inputFile

output = []
index = 0

while output.length != 8
  string = "#{original_string}#{index}"
  md5 = Digest::MD5.hexdigest string
  output << md5[5] if md5[0..4] == "00000"
  index += 1
end

p output.join
