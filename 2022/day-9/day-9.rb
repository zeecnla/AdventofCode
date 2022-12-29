require 'pry'

movements = []

count = 0

class Movement

   attr_accessor :step, :direction

   def initialize(step, direction)
     @step = step.to_i
     @direction = direction
   end

   def to_s
      puts "step :#{@step} and direction :#{direction}"
   end
end

class Head

   attr_accessor :row, :col

   def initialize(row, col)
     @row = row
     @col = col
   end
end

class Tail
    attr_accessor :row, :col

   def initialize(row, col)
     @row = row
     @col = col
   end
end

File.readlines('day-9-input.txt').each do |line|
   cleaned_line = line.chomp
   items = cleaned_line.split(" ")

   movements.push(Movement.new(items[1],items[0]))

end

current_head_location = [0,0]
current_tail_location= [0,0]

head_locations = []
tail_locations = []


tail_locations.push(current_tail_location)

def isAdjacent(row,col, current_tail_location)
   tail_row = current_tail_location[0]
   tail_col =current_tail_location[1]

   return true if row == tail_row && col ==tail_col
   return true if (row-tail_row).abs() <= 1 && (col-tail_col).abs() <=1
   return false
end

movements.each do |movement|

   direction = movement.direction
   step = movement.step

   while (step >= 1) do

      temp = current_head_location

      row = temp[0]
      col = temp[1]

      if direction =="R"
         col = col +1
      elsif direction =="U"
         row = row-1
      elsif direction =="D"
         row = row+1
      elsif direction =="L"
         col = col-1
      end

      current_head_location = [row,col]

      if !isAdjacent(row,col, current_tail_location)
         tail_locations.push(temp)
         current_tail_location = temp
      end

      step = step -1
   end
end

puts tail_locations.uniq.to_s

puts tail_locations.uniq.length









