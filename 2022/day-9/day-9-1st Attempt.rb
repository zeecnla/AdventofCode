require 'pry'

grid = []
tails_visited = []

directions = []
steps = []

count = 0

File.readlines('day-9-input.txt').each do |line|
   cleaned_line = line.chomp
   items = cleaned_line.split(" ")

   directions.push(items[0])

   steps.push(items[1])
end

grid_size = 19

(0...10000).each{ |item| grid.push(Array.new(10000,"."))}


(0...10000).each{ |item| tails_visited.push(Array.new(10000,0))}


start_row_index = 10000/2
start_col_index = 10000/2

row = 10000/2
col = 10000/2

tails_visited[start_row_index][start_col_index] = 1

puts "Start Position (#{start_row_index} ,#{start_col_index} )"

queue = []

# puts queue.to_s
# tails_visited.each{|list| puts list.to_s + "\n"}

current_tail_location = [start_row_index,start_col_index]

def isAdjacent(row,col,grid, current_tail_location)
   tail_row = current_tail_location[0]
   tail_col =current_tail_location[1]

   return true if row == tail_row && col ==tail_col
   return true if (row-tail_row).abs() <= 1 && (col-tail_col).abs() <=1
   return false
end

def directionChanged(direction, order_of_directions)
   return false if order_of_directions.empty?
   direction != order_of_directions.pop
end

grid[row][col] = "H"
order_of_directions = []

for index in 0 ...directions.size

   direction = directions[index]
   step = steps[index].to_i


   while (step >= 1) do


      grid[row][col] = "."
      if direction =="R"
         col = col +1
      elsif direction =="U"
         row = row-1
      elsif direction =="D"
         row = row+1
      elsif direction =="L"
         col = col-1
      end

      puts "#{row} row + #{col} col"

      grid[row][col] = "H"


      if directionChanged(direction, order_of_directions)
         queue.pop
      end

      if isAdjacent(row,col,grid,current_tail_location)
         queue.pop()
         queue.unshift([row,col])
      else
         queue.unshift([row,col])
      end

      # binding.pry if current_tail_location[0] ==0 && current_tail_location[1] ==2

      order_of_directions.push(direction)

      if !isAdjacent(row,col,grid,current_tail_location)
         # binding.pry
         grid[current_tail_location[0]][current_tail_location[1]] = "."
         tail_location = queue.pop
         grid[tail_location[0]][tail_location[1]] = "T"
         current_tail_location = tail_location
         tails_visited[tail_location[0]][tail_location[1]] = 1
      end
      step =step -1
   end
end


tails_visited.each {|list| list.each {|item| count = count + item.to_i}}
puts count




