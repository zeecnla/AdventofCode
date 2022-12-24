require 'pry'
solution = []
input = []
count = 0

File.readlines('day-8-input.txt').each do |line|
   cleaned_line = line.chomp
   individual_items = cleaned_line.split("")

   solution.push(Array.new(individual_items.length, 0))

   input.push(Array.new (individual_items))
end

def checkTop(input,row,col)

   temp = row-1
   temp.downto(0) do |index|
      if(input[index][col].to_i >=  input[row][col].to_i)
         return false
      end
   end

   return true
end

def checkBottom(input,row,col)

   for index in row+1 ...input.size
      if(input[index][col].to_i >=  input[row][col].to_i)
         return false
      end
   end

   return true
end

def checkRight(input,row,col)

   for index in col+1 ...input.size
      if(input[row][index].to_i >=  input[row][col].to_i)
         return false
      end
   end

   return true
end

def checkLeft(input,row,col)

   temp = col-1
   temp.downto(0) do |index|
      if(input[row][index].to_i >=  input[row][col].to_i)
         return false
      end
   end

   return true
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
      if checkTop(input, row, col) || checkBottom(input, row, col) || checkLeft(input, row, col) || checkRight(input, row, col)
         solution[row][col] = 1
      end
   end
end

solution.each{|list| puts list.to_s + "\n"}

solution.each {|list| list.each {|item| count = count + item.to_i}}

puts count
