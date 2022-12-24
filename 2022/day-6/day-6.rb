inputs = []

File.readlines('day-6-input-2.txt').each do |line|
   cleaned_line = line.chomp

   inputs.append(cleaned_line)
end
solution = 0

inputs.each do |line|

   left = 0
   right = 1
   solution = 0

   while solution == 0 do
      sliced = line.chars[left..right]
      if sliced.length >= 14 && sliced.uniq.length == sliced.length
         solution = right +1
      end
      if sliced.length >= 14
         left = left +1
         right = right+1
      else
         right =right +1
      end
   end
   puts solution
end


