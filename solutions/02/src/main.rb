ROCK = "ROCK"
PAPER = "PAPER"
SCISSORS = "SCISSORS"

DECODED_ACTIONS = {
  "A" => ROCK,
  "X" => ROCK,
  "B" => PAPER,
  "Y" => PAPER,
  "C" => SCISSORS,
  "Z" => SCISSORS,
}

SELECTION_SCORES = {
  ROCK => 1,
  PAPER => 2,
  SCISSORS => 3,
}

OUTCOME_SCORES = {
  "WIN" => 6,
  "DRAW" => 3,
  "LOSE" => 0,
}

def calculate_outcome(other_play, own_play)
  if other_play == own_play
    return "DRAW"
  end

  if other_play == ROCK
    own_play == PAPER ? "WIN" : "LOSE"
  elsif other_play == PAPER
    own_play == SCISSORS ? "WIN" : "LOSE"
  elsif other_play == SCISSORS
    own_play == ROCK ? "WIN" : "LOSE"
  end
end

total_score = 0

file = File.open("#{__dir__}/../files/outcomes.txt")
file.readlines.each do |line|
  plays = line.strip.split(" ")

  other_play = DECODED_ACTIONS[plays.first]
  own_play = DECODED_ACTIONS[plays.last]
  outcome = calculate_outcome(other_play, other_play)

  total_score += OUTCOME_SCORES[outcome] + SELECTION_SCORES[own_play]
end

puts "The final score is: #{total_score} points"
