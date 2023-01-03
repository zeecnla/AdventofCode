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

File.readlines('day-9-input-2.txt').each do |line|
   cleaned_line = line.chomp
   items = cleaned_line.split(" ")

   movements.push(Movement.new(items[1],items[0]))

end

snake = Array.new(10,[0,0])

head_locations = []
tail_locations=[]

movements.each do |movement|

   direction = movement.direction
   step = movement.step


   while (step >= 1) do

      temp = snake[0]

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

      snake[0] = [row,col]

      # (4,1) (2,2)
      # delta : 2, -1
      for i in 1...snake.length
         #check each direction to check
         delta_x = (snake[i-1][0] - snake[i][0])
         delta_y = (snake[i-1][1] - snake[i][1])

         if delta_x.abs() > 1 || delta_y.abs() >1

            temp = snake[i]
            new_row = temp[0]
            new_col = temp[1]


            if delta_x < 0
               new_row = new_row + -1
            elsif delta_x > 0
               new_row = new_row + 1
            end

            if delta_y < 0
               new_col = new_col + -1
            elsif delta_y > 0
               new_col = new_col + 1
            end

            snake[i] = [new_row,new_col]
         end

      end

      step = step -1
      tail_locations.push(snake.last())
   end
end


puts tail_locations.uniq.length










