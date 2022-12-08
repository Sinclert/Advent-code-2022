$movement_regex = Regexp.new("move (\\d+) from (\\d+) to (\\d+)", Regexp::IGNORECASE)
$crate_regex = Regexp.new("[A-Z]", Regexp::IGNORECASE)

$crates = {}
$moves = []

def parse_movement(move_spec)
  matches = $movement_regex.match(move_spec).captures

  $moves << {
    num: matches[0].to_i,
    from: matches[1].to_i,
    into: matches[2].to_i,
  }
end

def parse_cranes(cranes_spec)
  cranes_spec.scan(/... ?/).each_with_index do |spec, index|
    spec.strip!
    index += 1

    if $crates[index].nil? && !spec.empty?
      $crates[index] = []
    end

    if $crate_regex.match?(spec)
      $crates[index] << spec
    end
  end
end

def perform_move(move)
  origin = move[:from]
  target = move[:into]

  move[:num].times do
    $crates[target].insert(0, $crates[origin].shift)
  end
end


file = File.open("#{__dir__}/../files/cranes.txt")
file.readlines.each do |line|
  next if line.strip.empty?

  if $movement_regex.match?(line)
    parse_movement(line)
  else
    parse_cranes(line)
  end
end

$moves.each do |move|
  perform_move(move)
end

puts "Crates: #{$crates}"
puts "Movements: #{$moves}"
