PRIORITIES = Hash.new

("a".."z").to_a.each_with_index { |letter, index| PRIORITIES[letter] = index + 1 }
("A".."Z").to_a.each_with_index { |letter, index| PRIORITIES[letter] = index + 27 }

total_priority = 0

file = File.open("#{__dir__}/../files/items.txt")
file.readlines.each do |line|
  line.strip!

  middle_index = line.length / 2
  sack_1 = line[...middle_index].split("")
  sack_2 = line[middle_index...].split("")

  shared_items = sack_1.intersection(sack_2)
  shared_items.each do |item|
    puts "Shared item: #{item}"
    total_priority += PRIORITIES[item]
  end
end

puts "Total priority is: #{total_priority}"
