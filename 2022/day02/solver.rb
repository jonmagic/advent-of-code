# A = rock, X = rock, score = 1
# B = paper, Y = paper, score = 2
# C = scissor, Z = scissor, score = 3
# rock > scissor
# scissor > paper
# paper > rock
# == is a draw
# win, score = 6
# loss, score = 0
# draw, score = 3

mappings = {
  "A" => "rock",
  "X" => "rock",
  "B" => "paper",
  "Y" => "paper",
  "C" => "scissor",
  "Z" => "scissor",
  "rock" => 1,
  "paper" => 2,
  "scissor" => 3,
  "loss" => 0,
  "draw" => 3,
  "win" => 6,
}

def should_log
  false
end

def log(value)
  puts value if should_log
end

score = 0
File.readlines("input.csv").each do |line|
  line = line.gsub(/\n$/, "")
  log "line: #{line}"
  opponent, me = line.split(" ").map { |key| mappings[key] }
  points_from_choice = mappings[me]
  log "points_from_choice: #{points_from_choice}"
  score += points_from_choice

  if me == opponent
    points_from_result = mappings["draw"]
  elsif me == "rock" && opponent == "scissor"
    points_from_result = mappings["win"]
  elsif me == "scissor" && opponent == "paper"
    points_from_result = mappings["win"]
  elsif me == "paper" && opponent == "rock"
    points_from_result = mappings["win"]
  else
    points_from_result = mappings["loss"]
  end
  log "points_from_result: #{points_from_result}"
  score += points_from_result
end
puts "My score: #{score}"
