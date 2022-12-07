require 'pry'

# Part 1
# max_size = 0
# current_count = 0

# File.readlines('day-1-input.txt').each do |line|
#    cleaned_line = line.chomp
#    if cleaned_line==""
#       if max_size < current_count
#          max_size = current_count
#       end
#       current_count = 0
#    else
#       current_count+=cleaned_line.to_i
#    end
# end

# puts(max_size)

# Part 2

calorie_list = []
current_count = 0

File.readlines('day-1-input.txt').each do |line|
   cleaned_line = line.chomp 
   if cleaned_line==""
      calorie_list.append(current_count)
      current_count = 0
   else
      current_count+=cleaned_line.to_i
   end
end

calorie_list.append(current_count)

sorted_list = calorie_list.sort.reverse!

puts(sorted_list[0]+sorted_list[1]+sorted_list[2])


