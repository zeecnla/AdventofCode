require 'pry'

grid = []
tails_visited = []


directions = []
steps = []

count = 1

File.readlines('day-9-sample.txt').each do |line|
   cleaned_line = line.chomp
   items = cleaned_line.split(" ")

   directions.push(items[0])

   steps.push(items[1])
end


grid_size = steps.max.to_i

(0...grid_size).each{ |item| grid.push(Array.new(grid_size,"."))}


(0...grid_size).each{ |item| tails_visited.push(Array.new(grid_size,0))}


grid.each{|list| puts list.to_s + "\n"}

puts "Talis"
tails_visited.each{|list| puts list.to_s + "\n"}

start_row_index = grid.size-1
start_col_index = 0

row = grid.size-1
col = 0

tails_visited[start_row_index][start_col_index] = 1

puts "Start Position (#{start_row_index} ,#{start_col_index} )"

stack = []
stack.push([start_row_index,start_col_index])

puts stack.to_s

for index in 0 ...directions.size

   direction = directions[index]
   step = steps[index].to_i

   while (step >= 0) do
      isAdjacent()
      grid[row][col] = "H"
      if direction =="R"
         col = col +1
      elsif direction =="U"
         row = row-1
      elsif direction =="B"
         row = row+1
      elsif direction =="L"
         col = col-1
      end
      step =step -1
   end

end



tails_visited.each {|list| list.each {|item| count = count + item.to_i}}

puts count



