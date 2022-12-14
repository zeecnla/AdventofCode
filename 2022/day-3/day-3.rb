require 'pry'

## Part 1 : Yuck


# lower_case_indexes = ('a'..'z').each_with_index.map{|l,i| [l, i+1]}.to_h

# upper_case_indexes = ('A'..'Z').each_with_index.map{|l,i| [l, i+27]}.to_h

# indexes = lower_case_indexes.merge(upper_case_indexes)

# lines = []

# alphabet = []

# sum = 0

# File.readlines('day-3-input.txt').each do |line|
#    cleaned_line = line.chomp
#    lines.append(cleaned_line)
# end

# lines.each do |line|

#   first_alphabet = Array.new(125,0)
#   second_alphabet = Array.new(125,0)

#    first_part = line.slice(0, line.length/2)
#    second_part = line.slice(line.length/2, line.length)

#    first_part.split("").each do |letter|
#       first_alphabet[letter.ord] += 1
#    end

#    second_part.split("").each do |letter|
#       second_alphabet[letter.ord] += 1
#    end

#    first = first_alphabet.each_index.select{|i| first_alphabet[i] != 0}
#    second = second_alphabet.each_index.select{|i| second_alphabet[i] != 0}

#    result = first & second

#    sum += indexes[result[0].chr]

# end

#puts sum


# Part 2

lower_case_indexes = ('a'..'z').each_with_index.map{|l,i| [l, i+1]}.to_h

upper_case_indexes = ('A'..'Z').each_with_index.map{|l,i| [l, i+27]}.to_h

indexes = lower_case_indexes.merge(upper_case_indexes)

inputs = []

alphabet = []

sum = 0

File.readlines('day-3-input.txt').each do |line|
   cleaned_line = line.chomp
   inputs.append(cleaned_line)
end

inputs = inputs.each_slice(3).to_a

def getFrequency(line, alphabets)
   array = Array.new(125,0)
   line.split("").each do |letter|
      array[letter.ord] += 1
   end
   alphabets.push(array)
end

inputs.each do |line_of_3|

   # Array.new(125,0), Array.new(125,0), Array.new(125,0)
   alphabets = []

   line_of_3.each do |line|

      getFrequency(line, alphabets)

   end


   first = alphabets[0].each_index.select{|i| alphabets[0][i] != 0}
   second = alphabets[1].each_index.select{|i| alphabets[1][i] != 0}
   third = alphabets[2].each_index.select{|i| alphabets[2][i] != 0}


   result = first & second & third

   sum += indexes[result[0].chr]

end



puts sum






