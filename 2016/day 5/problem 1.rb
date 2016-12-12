require 'digest/md5'
require 'benchmark'

def parse_inputFile
  output = []
  File.open "input","r" do |file|
    file.each do |line|
      output << line
    end
  end
  output[0].chomp
end

#original_string = parse_inputFile
original_string = "abbhdwsy"
output = []
index = 0

md5_class = Digest::MD5.new

puts Benchmark.measure{
while output.length != 8
  string = original_string + index.to_s
  md5 = md5_class.hexdigest string
  output << md5[5] if md5[0] == "0" && md5[1] == "0" && md5[2] == "0" && md5[3] == "0" && md5[4] == "0"
  index += 1
end}

p output.join
