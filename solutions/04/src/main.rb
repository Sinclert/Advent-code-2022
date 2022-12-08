def overlap_pairs(bracket_1, bracket_2)
  (bracket_1.first <= bracket_2.first && bracket_1.last >= bracket_2.last) || \
  (bracket_2.first <= bracket_1.first && bracket_2.last >= bracket_1.last)
end

redundant_assignments = 0

file = File.open("#{__dir__}/../files/cleaning_sections.txt")
file.readlines.each do |line|
  line.strip!

  sections = line.split(",")
  first_elf_bracket = sections.first.split("-")
  last_elf_bracket = sections.last.split("-")

  if overlap_pairs(first_elf_bracket, last_elf_bracket)
    redundant_assignments += 1
  end
end

puts "The number of redundant assignments is: #{redundant_assignments}"
