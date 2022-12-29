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

File.readlines('day-9-sample.txt').each do |line|
   cleaned_line = line.chomp
   items = cleaned_line.split(" ")

   movements.push(Movement.new(items[1],items[0]))

end



def isAdjacent(head, item)

   item_row = item[0]
   item_col = item[1]

   row = head[0]
   col =head[1]

   return true if row == item_row && col ==item_col
   return true if (row-item_row).abs() <= 1 && (col-item_col).abs() <=1

   return false
end

def checkAndMoveSnake(snake, head_locations,tail_locations, direction)
    #make sure each item is adjacent from right to left

      head = snake.last

      snake.reverse.each_with_index  do |item,index|
         next if item == head

         if !isAdjacent(head,item)
            if index == snake.length-1
               tail_locations.push(item)
            end


            if !head_locations.empty?

               snake[snake.length-1-index]= head_locations.pop()

            else
               row = item[0]
               col = item[1]

               if direction =="R"
                  col = col +1
               elsif direction =="U"
                  row = row-1
               elsif direction =="D"
                  row = row+1
               elsif direction =="L"
                  col = col-1
               end

               snake[snake.length-1-index]= [row,col]


            end
            item = snake[snake.length-1-index]
         end
         head =item
      end
end

snake = Array.new(10,[0,0])

head_locations = []
tail_locations=[]

movements.each do |movement|

   direction = movement.direction
   step = movement.step

   first_step = step

   while (step >= 1) do

      temp = snake.pop()

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

      snake.push([row,col])

      if first_step == step
         head_locations.push([row,col])
      end

      checkAndMoveSnake(snake,head_locations,tail_locations,direction)

      step = step -1
   end
end

puts snake.to_s


puts tail_locations.uniq.to_s

puts tail_locations.uniq.length









