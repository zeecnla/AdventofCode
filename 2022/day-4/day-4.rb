

# inputs = []

# File.readlines('day-4-input.txt').each do |line|
#    cleaned_line = line.chomp
#    small_input  = cleaned_line.split(",")

#    inputs.append(small_input)
# end

# count = 0

# inputs.each do |line|

#    first_digits = line[0].split("-")
#    second_digits = line[1].split("-")

#    a = first_digits[0]
#    b = first_digits[1]
#    c = second_digits[0]
#    d = second_digits[1]

#    first = (a..b).to_a
#    second = (c..d).to_a

#    count = count+1 if ((first & second ) ==second) || ((first & second ) ==first)

# end

# puts count



inputs = []

File.readlines('day-4-input.txt').each do |line|
   cleaned_line = line.chomp
   small_input  = cleaned_line.split(",")

   inputs.append(small_input)
end

count = 0

inputs.each do |line|

   first_digits = line[0].split("-")
   second_digits = line[1].split("-")

   a = first_digits[0]
   b = first_digits[1]
   c = second_digits[0]
   d = second_digits[1]

   first = (a..b).to_a
   second = (c..d).to_a

   count = count +1 if (first & second ).any?

end

puts count

