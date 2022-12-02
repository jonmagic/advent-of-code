data = File.readlines("input.csv")
calories_by_elf = Hash.new(0)
elf = 1
most_calories = 0
data.each do |row|
  if row == "\n"
    elf += 1
  else
    calories_by_elf[elf] += row.to_i
  end

  if most_calories < calories_by_elf[elf]
    most_calories = calories_by_elf[elf]
  end
end
puts calories_by_elf
puts "\nMost calories: #{most_calories}"
