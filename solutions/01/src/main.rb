elves_calories = []
current_calories = 0

file = File.open("#{__dir__}/../files/calories.txt")

file.readlines.each do |line|
  if line.strip.empty?
    elves_calories << current_calories
    current_calories = 0
  else
    current_calories += line.to_i
  end
end

puts "The elf carrying the most calories has #{elves_calories.max} calories"
