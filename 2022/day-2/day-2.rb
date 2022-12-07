require 'pry'

# A = Rock  1
# B = Paper = 2
# C = Scissors = 3

# X = Rock  1
# Y = Paper = 2
# Z = Scissors = 3

# Win 6 points
# Draw 3 Points
# Lose 0 Points


# Part 1 Here Uncomment
# total = 0;


# # I am not proud of this hardcode section
# def didWin(first , second)
#    if first == "A" && second == "X" ||
#       first == "B" && second == "Y" ||
#       first == "C" && second == "Z"
#       return 3
#    #I wins
#    elsif second == "X" && first == "C" ||
#          second == "Y" && first == "A" ||
#          second == "Z" && first == "B"
#       return 6
#    else
#       return 0
#    end
# end

# File.readlines('day-2-input.txt').each do |line|
#    cleaned_line = line.chomp

#    game = cleaned_line.split(' ')

#    value = game[1]

#    if value == "X"
#       total+= 1
#    elsif value == "Y"
#       total+=2
#    elsif value == "Z"
#       total+=3
#    end

#    total += didWin(game[0], game[1])
# end

# puts total

# A = Rock  1
# B = Paper = 2
# C = Scissors = 3

# X = Lose  1 = Rock
# Y = Draw = 2 = Paper
# Z = Win = 3 = Scissors

# Win 6 points
# Draw 3 Points
# Lose 0 Points

total = 0;

def didWin(first , second)
   if first == "A" && second == "X"
      # Rock gets beat by Paper
      return 0 + 3
   elsif first == "B" && second =="X"
      return 0 + 1
   elsif first == "C" && second =="X"
      return 0 + 2
   elsif first == "A" && second == "Y"
      return 3 + 1
   elsif first == "B" && second =="Y"
      return 3 + 2
   elsif first == "C" && second =="Y"
      return 3 + 3
   elsif first == "A" && second == "Z"
      return 6 + 2
   elsif first == "B" && second =="Z"
      return 6 + 3
   elsif first == "C" && second =="Z"
      return 6 + 1
   end
end

File.readlines('day-2-input.txt').each do |line|
   cleaned_line = line.chomp

   game = cleaned_line.split(' ')

   total += didWin(game[0], game[1])
end

puts total




