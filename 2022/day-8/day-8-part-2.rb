require 'pry'
solution = []
input = []
count = 0

File.readlines('day-8-input-2.txt').each do |line|
   cleaned_line = line.chomp
   individual_items = cleaned_line.split("")

   solution.push(Array.new(individual_items.length, 0))

   input.push(Array.new (individual_items))
end

def checkTop(input,row,col)

   temp = row-1
   tree_count = 0
   temp.downto(0) do |index|
      tree_count = tree_count + 1
      if(input[index][col].to_i >=  input[row][col].to_i)
         break
      end
   end

   return tree_count
end

def checkBottom(input,row,col)

   tree_count = 0
   for index in row+1 ...input.size
      tree_count = tree_count + 1
      if(input[index][col].to_i >=  input[row][col].to_i)
         break
      end
   end

   return tree_count
end

def checkRight(input,row,col)

   tree_count=0
   for index in col+1 ...input.size
      tree_count = tree_count + 1
      if(input[row][index].to_i >=  input[row][col].to_i)
         break
      end
   end

   return tree_count
end

def checkLeft(input,row,col)

   temp = col-1
   tree_count=0
   temp.downto(0) do |index|
      tree_count = tree_count + 1
      if(input[row][index].to_i >=  input[row][col].to_i)
         break
      end
   end

   return tree_count
end

# All edge trees are visible

for index in 0 ... input.size

   # Horizontal
   solution[0][index] = 1
   solution[input.size-1][index] = 1

   # Columns
   solution[index][input.size-1] = 1
   solution[index][0] = 1
end

for row in 1 ... input.size-1
   for col in 1 ... input.size-1
      #check top
      solution[row][col] = checkTop(input, row, col) * checkBottom(input, row, col) * checkLeft(input, row, col) * checkRight(input, row, col)
   end

end

solution.each{|list| puts list.to_s + "\n"}

puts solution.flatten.max
