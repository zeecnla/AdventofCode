inputs = []


inputs = File.readlines("day-5-sample.txt").map { |str| str.split(/\n{2,}/) }

map = inputs.slice(0..3)
commands = inputs.slice(5, inputs.length)
# 0-2 => 1
# 4-6 => 2
# 8-10 =>3
columns = map.transpose

puts columns.to_s



