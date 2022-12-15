# inputs = []

# map, commands = File.read('day-5-input.txt').split("\n\n")

# building_stacks = map.split("\n")[...-1].reverse.map do |row|
#    row.chars.each_slice(4).to_a.map do |letter|

#       character = letter[1]

#       if character == " "
#          nil
#       else
#          character
#       end
#    end
# end

# length = building_stacks.map(&:length).max
# nil_stacks = building_stacks.map{|e| e.values_at(0...length)}.transpose


# stacks = nil_stacks.each &:compact!

# # organize commands to list of arrays

# commands_split = commands.split("\n")

# instructions = commands_split.map do |line|
#    line.split(" from ")
# end

# def calculate_steps(stacks, instructions)
#    instructions.each do |line|

#       location = line[1].split(" to ")

#       amount = line[0].split(" ")[1].to_i
#       from = location[0].to_i() -1
#       to = location[1].to_i() -1

#       for i in 1..amount do

#          item_popped = stacks[from].pop
#          stacks[to].append(item_popped)
#          puts stacks.to_s
#       end

#    end
#    puts stacks.map{|stack| stack.last}
# end

# calculate_steps(stacks,instructions)

# Part 2

inputs = []

map, commands = File.read('day-5-input.txt').split("\n\n")

building_stacks = map.split("\n")[...-1].reverse.map do |row|
   row.chars.each_slice(4).to_a.map do |letter|

      character = letter[1]

      if character == " "
         nil
      else
         character
      end
   end
end

length = building_stacks.map(&:length).max
nil_stacks = building_stacks.map{|e| e.values_at(0...length)}.transpose

stacks = nil_stacks.each &:compact!

# organize commands to list of arrays

commands_split = commands.split("\n")

instructions = commands_split.map do |line|
   line.split(" from ")
end

def calculate_steps(stacks, instructions)
   instructions.each do |line|

      location = line[1].split(" to ")

      amount = line[0].split(" ")[1].to_i
      from = location[0].to_i() -1
      to = location[1].to_i() -1

      if amount > 1

         items = stacks[from].pop(amount)
         puts "items popped "+ items.to_s
         stacks[to].concat(items)

      else
         item_popped = stacks[from].pop
         stacks[to].append(item_popped)
      end

      puts stacks.to_s

   end
   puts stacks.map{|stack| stack.last}
end

calculate_steps(stacks,instructions)
